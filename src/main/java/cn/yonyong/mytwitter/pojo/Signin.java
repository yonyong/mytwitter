package cn.yonyong.mytwitter.pojo;

import java.sql.Timestamp;
/**
 * create by: yonyong
 * description: TODO
 * create time: 2019/3/18 16:28
 *
 */
public class Signin {
	private int sid;
	private int uid;
	private Timestamp stime;
	private Timestamp sdtime;

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Timestamp getStime() {
		return stime;
	}

	public void setStime(Timestamp stime) {
		this.stime = stime;
	}

	public Timestamp getSdtime() {
		return sdtime;
	}

	public void setSdtime(Timestamp sdtime) {
		this.sdtime = sdtime;
	}

}
