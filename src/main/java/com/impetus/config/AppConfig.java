package com.impetus.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
//...
import org.springframework.core.env.Environment;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;

@Configuration
@ComponentScan(basePackages = { "com.impetus.*" })
@PropertySource("classpath:config.properties")
public class AppConfig {

	//1.2.3.4
	@Value("${kibana.url}")
	private String mongodbUrl;

	public String getMongodbUrl() {
		return mongodbUrl;
	}

	public void setMongodbUrl(String mongodbUrl) {
		this.mongodbUrl = mongodbUrl;
	}

	public String getDefaultDb() {
		return defaultDb;
	}

	public void setDefaultDb(String defaultDb) {
		this.defaultDb = defaultDb;
	}

	//hello
	@Value("${test.db}")
	private String defaultDb;
	
	@Autowired
	private Environment env;

	
	public void getconfig() throws Exception {

		String testurl = env.getProperty("kibana.url");
		String testdb = env.getProperty("test.db");
		System.out.println(" testurl -> " + testurl + " and testdb ->   "
				+ testdb);
		CreateElasticsearchIndex();
		insertDataUsingLogstash();
	}

	public void CreateElasticsearchIndex() throws Exception {
		Client client = TransportClient
				.builder()
				.build()
				.addTransportAddress(
						new InetSocketTransportAddress(InetAddress
								.getByName("127.0.0.1"), 9300));
		boolean exists = client.admin().indices().prepareExists("cnxapplogs")
				.execute().actionGet().isExists();
		if (!exists) {
			client.admin()
					.indices()
					.prepareCreate("cnxapplogs")
					.addMapping(
							"application",
							"{\n"
									+ "    \"application\": {\n"
									+ "      \"properties\": {\n"
									+ "        \"@timestamp\": {\n"
									+ "          \"format\": \"strict_date_optional_time||epoch_millis\",\n"
									+ "          \"type\": \"date\"\n"
									+ "        },\n"
									+ "        \"error\": {\n"
									+ "          \"index\": \"not_analyzed\",\n"
									+ "          \"type\": \"string\"\n"
									+ "        },\n"
									+ "        \"newclass\": {\n"
									+ "          \"type\": \"string\"\n"
									+ "        },\n"
									+ "        \"@version\": {\n"
									+ "          \"type\": \"string\"\n"
									+ "        },\n"
									+ "        \"ModuleName\": {\n"
									+ "          \"type\": \"string\"\n"
									+ "        },\n"
									+ "        \"host\": {\n"
									+ "          \"type\": \"string\"\n"
									+ "        },\n"
									+ "        \"path\": {\n"
									+ "          \"type\": \"string\"\n"
									+ "        },\n"
									+ "        \"timestamp\": {\n"
									+ "          \"type\": \"string\"\n"
									+ "        },\n"
									+ "        \"message\": {\n"
									+ "          \"type\": \"string\"\n"
									+ "        },\n"
									+ "        \"loglevel\": {\n"
									+ "          \"type\": \"string\"\n"
									+ "        },\n"
									+ "        \"type\": {\n"
									+ "          \"type\": \"string\"\n"
									+ "        },\n"
									+ "        \"javaclass\": {\n"
									+ "          \"index\": \"not_analyzed\",\n"
									+ "          \"type\": \"string\"\n"
									+ "        }\n" + "      }\n" + "    }\n"
									+ "  }").get();
		}
	}
	
	public void insertDataUsingLogstash() {

		 Runtime runtime = Runtime.getRuntime();
		 try {
		 Process p1 = runtime.exec("cmd /c start D:/bb.VBS");
		 InputStream is = p1.getInputStream();
		 
		 int i = 0;
		 while( (i = is.read() ) != -1) {
		 System.out.print((char)i);
		
		 }
		 } catch(IOException ioException) {
		 System.out.println(ioException.getMessage() );
		 }	
		
		}
	//To resolve ${} in @Value
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
		return new PropertySourcesPlaceholderConfigurer();
	}

}