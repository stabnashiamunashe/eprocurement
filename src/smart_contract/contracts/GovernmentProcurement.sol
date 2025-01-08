// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

// Ownable contract to manage ownership and restricted access to certain functions.
contract Ownable {
    address private _owner;

    // Event to emit when ownership is transferred.
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    // Constructor to set the original owner to the deployer of the contract.
    constructor() {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    // Modifier to restrict access to owner-only functions.
    modifier onlyOwner() {
        require(owner() == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    // Function to return the address of the current owner.
    function owner() public view returns (address) {
        return _owner;
    }

    // Function to transfer ownership to a new owner.
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

// Contract to store and retrieve document hashes on-chain.
contract DocumentRegistry is Ownable {
    // Mapping from document ID to document hash.
    mapping(string => string) public documentHashes;

    // Event to be emitted when a document hash is stored.
    event DocumentHashStored(string documentID, string documentHash);

    /**
     * @dev Stores the hash of a document on-chain.
     * @param _documentID The unique ID of the document (e.g., the filename).
     * @param _documentHash The SHA-256 hash of the document.
     */
    function storeDocumentHash(string memory _documentID, string memory _documentHash) public onlyOwner {
        documentHashes[_documentID] = _documentHash;
        emit DocumentHashStored(_documentID, _documentHash);
    }

    /**
     * @dev Retrieves the hash of a document stored on-chain.
     * @param _documentID The unique ID of the document to retrieve.
     * @return The SHA-256 hash of the document.
     */
    function getDocumentHash(string memory _documentID) public view returns (string memory) {
        return documentHashes[_documentID];
    }
}

// Contract to manage government procurement tenders.
contract GovernmentProcurement is Ownable {
    // Struct to store tender details.
    struct Tender {
        uint id;
        string title;
        string description;
        string location;
        address ministry;
        uint deadline;
        uint bidFee;
        uint tenderValue;
        string financier;
        string purchaserOwnership;
        TenderStatus status;
        address[] bidders;
        uint[] bidAmounts;
    }

    // Struct to store vendor details.
    struct Vendor {
        address vendorAddress;
        string name;
        string registrationNumber;
        bool approved;
        uint registrationDate;
        string certificateOfIncorporationLink;
        string taxClearanceCertificateLink;
        string certificateOfIncorporationHash;
        string taxClearanceCertificateHash;
    }

    // Enum to represent tender status.
    enum TenderStatus { Open, Closed, Awarded }

    // Mappings to store tenders and vendors.
    mapping(uint => Tender) public tenders;
    mapping(address => Vendor) public vendors;
    mapping(uint => mapping(address => uint)) public bids;

    // Array to store all vendor addresses.
    address[] public vendorAddresses;

    // Counter to keep track of the number of tenders.
    uint public tenderCounter;
    // Address of the ERC20 token used for payments.
    address public paymentToken;

    // Events for logging key actions.
    event TenderPosted(uint tenderId, string title, address ministry);
    event BidPlaced(uint tenderId, address vendor, uint amount);
    event TenderAwarded(uint tenderId, address vendor);
    event PaymentMade(uint tenderId, address vendor, uint amount);
    event VendorRegistered(address vendorAddress, string name);
    event VendorApproved(address vendorAddress);

    // Constructor to set the payment token.
    constructor(address _paymentToken) {
        paymentToken = _paymentToken;
    }

    // Function for vendors to register.
    function registerVendor(
        string memory _name,
        string memory _registrationNumber,
        string memory _certificateOfIncorporationLink,
        string memory _certificateOfIncorporationHash,
        string memory _taxClearanceCertificateLink,
        string memory _taxClearanceCertificateHash
    ) external {
        require(!vendors[msg.sender].approved, "Vendor already registered");
        vendors[msg.sender] = Vendor({
            vendorAddress: msg.sender,
            name: _name,
            registrationNumber: _registrationNumber,
            approved: false,
            certificateOfIncorporationLink: _certificateOfIncorporationLink,
            certificateOfIncorporationHash: _certificateOfIncorporationHash,
            taxClearanceCertificateLink: _taxClearanceCertificateLink,
            taxClearanceCertificateHash: _taxClearanceCertificateHash,
            registrationDate: block.timestamp
        });
        vendorAddresses.push(msg.sender);
        emit VendorRegistered(msg.sender, _name);
    }

    // Function for the owner to approve a vendor.
    function approveVendor(address _vendor) external onlyOwner {
        require(!vendors[_vendor].approved, "Vendor already approved");
        vendors[_vendor].approved = true;
        emit VendorApproved(_vendor);
    }

    // Function to post a new tender.
    function postTender(
        string memory _title,
        string memory _description,
        string memory _location,
        uint _deadline,
        uint _bidFee,
        uint _tenderValue,
        string memory _financier,
        string memory _purchaserOwnership
    ) external onlyOwner {
        require(_deadline > block.timestamp, "Deadline must be in the future");

        tenderCounter++;

        address[] memory emptyAddressArray;
        uint[] memory emptyUintArray;

        tenders[tenderCounter] = Tender({
            id: tenderCounter,
            title: _title,
            description: _description,
            location: _location,
            ministry: msg.sender,
            deadline: _deadline,
            bidFee: _bidFee,
            tenderValue: _tenderValue,
            financier: _financier,
            purchaserOwnership: _purchaserOwnership,
            status: TenderStatus.Open,
            bidders: emptyAddressArray,
            bidAmounts: emptyUintArray
        });

        emit TenderPosted(tenderCounter, _title, msg.sender);
    }

    // Function for approved vendors to place bids.
    function placeBid(uint _tenderId, uint _amount) external {
        Tender storage tender = tenders[_tenderId];
        require(tender.status == TenderStatus.Open, "Tender is not open");
        require(block.timestamp < tender.deadline, "Tender deadline has passed");
        require(vendors[msg.sender].approved, "Vendor not approved");

        IERC20(paymentToken).transferFrom(msg.sender, address(this), tender.bidFee);

        tender.bidders.push(msg.sender);
        tender.bidAmounts.push(_amount);
        bids[_tenderId][msg.sender] = _amount;

        emit BidPlaced(_tenderId, msg.sender, _amount);
    }

    // Function for the ministry to close a tender after the deadline.
    function closeTender(uint _tenderId) external {
        Tender storage tender = tenders[_tenderId];
        require(tender.ministry == msg.sender, "Only the posting ministry can close the tender");
        require(block.timestamp >= tender.deadline, "Deadline has not passed");
        require(tender.status == TenderStatus.Open, "Tender is not open");

        tender.status = TenderStatus.Closed;
    }

    // Function to award a tender to a vendor.
    function awardTender(uint _tenderId, address _vendor) external {
        Tender storage tender = tenders[_tenderId];
        require(tender.ministry == msg.sender, "Only the posting ministry can award the tender");
        require(tender.status == TenderStatus.Closed, "Tender is not closed");
        require(bids[_tenderId][_vendor] > 0, "Vendor did not place a bid");

        tender.status = TenderStatus.Awarded;
        emit TenderAwarded(_tenderId, _vendor);

        // Transfer payment to the winning vendor.
        uint bidAmount = bids[_tenderId][_vendor];
        IERC20(paymentToken).transfer(_vendor, bidAmount);
        emit PaymentMade(_tenderId, _vendor, bidAmount);
    }

    // Function to withdraw bid fees by the ministry if no tender is awarded.
    function withdrawBidFees(uint _tenderId) external onlyOwner {
        Tender storage tender = tenders[_tenderId];
        require(tender.status == TenderStatus.Closed, "Tender must be closed");

        uint totalBidFees = tender.bidFee * tender.bidders.length;
        IERC20(paymentToken).transfer(msg.sender, totalBidFees);
    }

    // Function for vendors to withdraw their bid if the tender is not awarded.
    function withdrawBid(uint _tenderId) external {
        Tender storage tender = tenders[_tenderId];
        require(tender.status == TenderStatus.Closed, "Tender must be closed");
        require(bids[_tenderId][msg.sender] > 0, "No bid to withdraw");

        uint bidAmount = bids[_tenderId][msg.sender];
        delete bids[_tenderId][msg.sender];

        IERC20(paymentToken).transfer(msg.sender, bidAmount);
    }

    // Function to retrieve all vendors.
    function getAllVendors() external view returns (Vendor[] memory) {
        Vendor[] memory allVendors = new Vendor[](vendorAddresses.length);
        for (uint i = 0; i < vendorAddresses.length; i++) {
            allVendors[i] = vendors[vendorAddresses[i]];
        }
        return allVendors;
    }

    function getAllVendorsTest() public view returns (Vendor[] memory) {
        Vendor[] memory allVendors = new Vendor[](vendorAddresses.length);
        for (uint i = 0; i < vendorAddresses.length; i++) {
            allVendors[i] = vendors[vendorAddresses[i]];
        }
        return allVendors;
    }

    // Function to retrieve a vendor by their address.
    function getVendorById(address _vendor) external view returns (Vendor memory) {
        return vendors[_vendor];
    }

    // Function to retrieve a tender by its ID.
    function getTenderById(uint _tenderId) external view returns (Tender memory) {
        return tenders[_tenderId];
    }

    // Function to retrieve the bids for a tender by its ID.
    function getBidsForTender(uint _tenderId) external view returns (address[] memory, uint[] memory) {
        Tender storage tender = tenders[_tenderId];
        return (tender.bidders, tender.bidAmounts);
    }
}
