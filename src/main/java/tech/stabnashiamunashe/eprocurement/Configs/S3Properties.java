package tech.stabnashiamunashe.eprocurement.Configs;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("aws.properties")
public record S3Properties(String accessKey, String secretKey, String bucketName, String region) {
}
