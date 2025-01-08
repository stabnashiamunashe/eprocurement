package tech.stabnashiamunashe.eprocurement;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.EnableCaching;
import tech.stabnashiamunashe.eprocurement.Security.Configs.RSAKeyProperties;
import tech.stabnashiamunashe.eprocurement.Configs.S3Properties;

@EnableConfigurationProperties({RSAKeyProperties.class, S3Properties.class})
@EnableCaching
@SpringBootApplication
public class EprocurementApplication {

	public static void main(String[] args) {
		SpringApplication.run(EprocurementApplication.class, args);
	}

}
