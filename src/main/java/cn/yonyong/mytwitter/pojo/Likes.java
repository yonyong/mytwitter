package cn.yonyong.mytwitter.pojo;

import java.sql.Timestamp;
/**
 * create by: yonyong
 * description: 推文喜欢操作实体类
 * create time: 2019/3/18 16:21
 *
 */
public class Likes {
	private int lid;		//喜欢记录id
	private int uid;		//喜欢者id
	private int tid;		//喜欢的推文id
	private Timestamp ltime;		//喜欢的时间

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
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

	public Timestamp getLtime() {
		return ltime;
	}

	public void setLtime(Timestamp ltime) {
		this.ltime = ltime;
	}

}
