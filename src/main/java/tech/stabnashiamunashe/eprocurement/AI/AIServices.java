package tech.stabnashiamunashe.eprocurement.AI;

import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.client.advisor.MessageChatMemoryAdvisor;
import org.springframework.ai.chat.client.advisor.QuestionAnswerAdvisor;
import org.springframework.ai.chat.memory.InMemoryChatMemory;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.stereotype.Service;

@Service
public class AIServices {
    private final ChatClient chatClient;

    public AIServices(ChatClient.Builder builder) {
        this.chatClient = builder
                .defaultSystem("\"You are an expert in public procurement evaluation, tasked with assessing bid documents based on the following criteria: " +
                        "[list criteria with descriptions]. Each criterion has an assigned weight, and you will score each based on the document's adherence to requirements. " +
                        "Assign scores from 1 to 10, with 10 indicating complete fulfillment of a criterion, and provide brief feedback for each score. " +
                        "Use consistent language and scoring standards to ensure identical assessments for identical documents." +
                        "You are to evaluate the attached bid document based on the criteria provided. The document is a proposal for the supply of [product/service]." +
                        "Please provide a detailed evaluation of the document, including scores and feedback for each criterion. You may also include an overall assessment of the document's quality and adherence to requirements.")
                .defaultAdvisors(
//                        new QuestionAnswerAdvisor(vectorStore),
                        new MessageChatMemoryAdvisor(new InMemoryChatMemory())

                )
                .build();
    }

    public String chat(String message) {
        return chatClient.prompt()
                .user(message)
                .call()
                .content();
    }
}
