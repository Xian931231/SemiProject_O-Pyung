package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.JDBCTemplate;

public class CalendarDao extends JDBCTemplate{
	
	PreparedStatement pstm = null;
	Connection con = getConnection();
	int res = 0;

}
