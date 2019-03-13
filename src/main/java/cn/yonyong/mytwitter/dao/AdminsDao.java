package cn.yonyong.mytwitter.dao;

import cn.yonyong.mytwitter.pojo.Admins;
import cn.yonyong.mytwitter.util.DBUtil;

import java.util.List;

public class AdminsDao {
	public Admins checkLogin(String username, String password) {
		String sql = "select aid,aname,apwd,atime,astate,apower from admins where aname=? and apwd=?";
		List<Admins> list = DBUtil.query(Admins.class, sql, username, password);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public int updateOnline(int astate, int aid) {
		String sql = "update admins set astate=? where aid=?";
		int n = DBUtil.update(sql, astate, aid);
		return n;
	}

}
