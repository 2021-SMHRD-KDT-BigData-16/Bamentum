package com.tscm.db;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	
	public static SqlSessionFactory sqlSessionFactory;
	
	static {
		// 프로젝트 시 resource 경로만 잘 확인하기. 
		String resource = "com/tscm/db/mybatis-config.xml";
		
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);	
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// sqlSessionFactory 리턴해주는 메소드 정의
	public static SqlSessionFactory getFactory() {
		return sqlSessionFactory;
	}
	

}
