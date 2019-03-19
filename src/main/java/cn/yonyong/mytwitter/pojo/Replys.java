package cn.yonyong.mytwitter.pojo;

import java.sql.Timestamp;
/**
 * create by: yonyong
 * description: 评论/回复操作实体类
 * create time: 2019/3/18 16:26
 *
 */
public class Replys {
	private int rid;		//评论记录id
	private int uid;		//评论者userid
	private int tid;		//评论的推文id
	private String rcontent;		//评论的内容
	private Timestamp rtime;		//评论的时间

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public Timestamp getRtime() {
		return rtime;
	}

	public void setRtime(Timestamp rtime) {
		this.rtime = rtime;
	}

}
