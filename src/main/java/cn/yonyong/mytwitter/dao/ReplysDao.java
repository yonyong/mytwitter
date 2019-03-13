package cn.yonyong.mytwitter.dao;


import cn.yonyong.mytwitter.pojo.Replyall;
import cn.yonyong.mytwitter.util.DBUtil;

import java.sql.Timestamp;
import java.util.List;

public class ReplysDao {
	public int addReplys(int tid, String neirong, int uid, Timestamp rtime) {
		String sql = "insert into replys(uid,tid,rcontent,rtime) values(?,?,?,?)";
		int n = DBUtil.update(sql, uid, tid, neirong, rtime);
		return n;
	}

	public List<Replyall> getAllReply(int tid, int page) {
		String sql = "select rid,uid,tid,rcontent,rtime,uname,urealname,ulogo,uaite from replyall where tid=? order by rtime desc limit ?,6";
		List<Replyall> list = DBUtil.query(Replyall.class, sql, tid, page);
		if (list.size() > 0) {
			return list;
		}
		return null;
	}
}
