package bbs;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class BbsDAO {

		// dao : �뜲�씠�꽣踰좎씠�뒪 �젒洹� 媛앹껜�쓽 �빟�옄

	

		private Connection conn; // connection:db�뿉�젒洹쇳븯寃� �빐二쇰뒗 媛앹껜

		//private PreparedStatement pstmt;

		private ResultSet rs;



		// mysql 泥섎━遺�遺�

		public BbsDAO() {

			// �깮�꽦�옄瑜� 留뚮뱾�뼱以��떎.

			try {

				Class.forName("com.mysql.jdbc.Driver");
				
				String dbURL = "jdbc:mysql://database-2.caaxfeb6vg5f.ap-northeast-2.rds.amazonaws.com/";

				String dbID = "admin";

				String dbPassword = "kimku0540)";
				
				String dbName = "shopping";

				conn = DriverManager.getConnection(dbURL+dbName, dbID, dbPassword);

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		

		//�쁽�옱�쓽 �떆媛꾩쓣 媛��졇�삤�뒗 �븿�닔

		public String getDate() { 

			String SQL = "SELECT NOW()";

			try {

				PreparedStatement pstmt = conn.prepareStatement(SQL);

				rs = pstmt.executeQuery();

				if(rs.next()) {

					return rs.getString(1);

				}

			} catch (Exception e) {

				e.printStackTrace();

			}

			return ""; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�

		}

		

		//bbsID 寃뚯떆湲� 踰덊샇 媛��졇�삤�뒗 �븿�닔

			public int getNext() { 

				String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";

				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);

					rs = pstmt.executeQuery();

					if(rs.next()) {

						return rs.getInt(1) + 1;

					}

					return 1;//泥� 踰덉㎏ 寃뚯떆臾쇱씤 寃쎌슦

				} catch (Exception e) {

					e.printStackTrace();

				}

				return -1; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�

			}

			

			public int write(String userID, String title, String content, String contract, int req) { 

				String SQL = "INSERT INTO board (boardTitle, userID, content, point, contract) VALUES(?, ?, ?, ?, ?)";

				try {

					

					PreparedStatement pstmt = conn.prepareStatement(SQL);

					pstmt.setString(1, title);

					pstmt.setString(2, userID);

					pstmt.setString(3, content);

					pstmt.setInt(4, req);

					pstmt.setString(5, contract);

					

					return pstmt.executeUpdate();

					

				} catch (Exception e) {

					e.printStackTrace();

				}

				return -1; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�

			}

			public ResultSet getBoard() {
				String SQL = "SELECT * FROM board";
				
				ResultSet r =null;
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					r = pstmt.executeQuery();
					return r;
				}
				catch(SQLException e){
					e.printStackTrace();
				}
				return null;
			}
			public ResultSet getBoardDetail(int a) {
				String SQL = "SELECT * FROM board where boardIdx=?";
				
				ResultSet r =null;
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, a);

					r = pstmt.executeQuery();
					return r;
				}
				catch(SQLException e){
					e.printStackTrace();
				}
				return null;
			}
			public ArrayList<Bbs> getList(int pageNumber){ 

				String SQL = "SELECT * FROM BBS";

				ArrayList<Bbs> list = new ArrayList<Bbs>();

				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);


					rs = pstmt.executeQuery();

					while (rs.next()) {

						Bbs bbs = new Bbs();

						bbs.setBbsID(rs.getInt(1));
						bbs.setBbsTitle(rs.getString(2));
						bbs.setUserID(rs.getString(3));
						bbs.setBbsDate(rs.getString(4));
						bbs.setBbsContent(rs.getString(5));
						bbs.setBbsAvailable(rs.getInt(6));
						list.add(bbs);

					}

				} catch (Exception e) {

					e.printStackTrace();

				}

				return list; 

			}
			
//			public boolean nextPage (int pageNumber) {
//
//				String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1";
//				ArrayList<Bbs> list = new ArrayList<Bbs>();
//
//				try {
//
//					PreparedStatement pstmt = conn.prepareStatement(SQL);
//
//					pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
//
//					rs = pstmt.executeQuery();
//
//					if (rs.next()) {
//
//						return true;
//
//					}
//
//				} catch (Exception e) {
//
//					e.printStackTrace();
//
//				}
//
//				return false; 		
//
//			}

	}
