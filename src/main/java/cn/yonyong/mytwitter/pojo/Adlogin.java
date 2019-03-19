package cn.yonyong.mytwitter.pojo;

import java.sql.Timestamp;

/**
 * create by: yonyong
 * description: 管理员登入登出后台管理系统信息记录
 * create time: 2019/3/18 16:15
 *
 */
public class Adlogin {
	private int adid;		//记录id
	private int aid;		//管理员id
	private Timestamp aditime;		//管理员登入系统时间
	private Timestamp adotime;		//管理员登出系统时间

	public int getAdid() {
		return adid;
	}

	public void setAdid(int adid) {
		this.adid = adid;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public Timestamp getAditime() {
		return aditime;
	}

	public void setAditime(Timestamp aditime) {
		this.aditime = aditime;
	}

	public Timestamp getAdotime() {
		return adotime;
	}

	public void setAdotime(Timestamp adotime) {
		this.adotime = adotime;
	}
}
