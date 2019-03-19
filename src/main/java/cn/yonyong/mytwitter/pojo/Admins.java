package cn.yonyong.mytwitter.pojo;

import java.sql.Timestamp;

/**
 * create by: yonyong
 * description: 管理员实体类
 * create time: 2019/3/18 16:17
 *
 */
public class Admins {
	private int aid;		//管理员id
	private String aname;		//管理员昵称
	private String apwd;		//管理员密码
	private Timestamp atime;		//管理员创建时间
	private int astate;		// TODO
	private int apower;

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getApwd() {
		return apwd;
	}

	public void setApwd(String apwd) {
		this.apwd = apwd;
	}

	public Timestamp getAtime() {
		return atime;
	}

	public void setAtime(Timestamp atime) {
		this.atime = atime;
	}

	public int getApower() {
		return apower;
	}

	public void setApower(int apower) {
		this.apower = apower;
	}

	public int getAstate() {
		return astate;
	}

	public void setAstate(int astate) {
		this.astate = astate;
	}

}
