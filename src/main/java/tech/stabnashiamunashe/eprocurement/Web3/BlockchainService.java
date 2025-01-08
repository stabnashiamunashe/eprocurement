//package tech.stabnashiamunashe.eprocurement.Web3;
//
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Service;
//import org.web3j.crypto.Credentials;
//import org.web3j.protocol.Web3j;
//import org.web3j.protocol.core.methods.response.TransactionReceipt;
//import org.web3j.tx.gas.DefaultGasProvider;
//import tech.stabnashiamunashe.eprocurement.Models.Tender;
//
//import java.math.BigInteger;
//
//@Service
//@RequiredArgsConstructor
//public class BlockchainService {
//
//    private final Web3j web3j;
//    private final Credentials credentials;
//    private final String contractAddress;
//
//    public GovernmentProcurement loadContract() {
//        return GovernmentProcurement.load(contractAddress, web3j, credentials, new DefaultGasProvider());
//    }
//
//    // Post a new tender
//    public String postTender(String title, String description, String location, BigInteger deadline, BigInteger bidFee,
//                             BigInteger tenderValue, String financier, String purchaserOwnership) throws Exception {
//        GovernmentProcurement contract = loadContract();
//        TransactionReceipt receipt = contract.postTender(title, description, location, deadline, bidFee, tenderValue, financier, purchaserOwnership).send();
//        return receipt.getTransactionHash();
//    }
//
//    // Register a vendor
//    public String registerVendor(String name, String registrationNumber, String certificateOfIncorporationLink,
//                                 String certificateOfIncorporationHash, String taxClearanceCertificateLink,
//                                 String taxClearanceCertificateHash) throws Exception {
//        GovernmentProcurement contract = loadContract();
//        TransactionReceipt receipt = contract.registerVendor(name, registrationNumber, certificateOfIncorporationLink,
//                certificateOfIncorporationHash, taxClearanceCertificateLink, taxClearanceCertificateHash).send();
//        return receipt.getTransactionHash();
//    }
//
//    // Place a bid
//    public String placeBid(BigInteger tenderId, BigInteger amount) throws Exception {
//        GovernmentProcurement contract = loadContract();
//        TransactionReceipt receipt = contract.placeBid(tenderId, amount).send();
//        return receipt.getTransactionHash();
//    }
//
//    // Award a tender
//    public String awardTender(BigInteger tenderId, String vendorAddress) throws Exception {
//        GovernmentProcurement contract = loadContract();
//        TransactionReceipt receipt = contract.awardTender(tenderId, vendorAddress).send();
//        return receipt.getTransactionHash();
//    }
//
//    // Retrieve a tender
//    public Tender getTender(BigInteger tenderId) throws Exception {
//        GovernmentProcurement contract = loadContract();
//        return contract.getTenderById(tenderId).send();
//    }
//}
