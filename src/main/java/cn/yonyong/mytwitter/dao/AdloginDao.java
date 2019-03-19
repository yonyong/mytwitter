package cn.yonyong.mytwitter.dao;

import cn.yonyong.mytwitter.pojo.Adlogin;
import cn.yonyong.mytwitter.util.DBUtil;

import java.sql.Timestamp;
import java.util.List;

 /**
 * create by: yonyong
 * description: 管理员登陆dao层
 * create time: 2019/3/13 21:41
 *
 */
public class AdloginDao {

	 /**
	  * create by: yonyong
	  * description: 添加管理员登入后台记录
	  * create time: 2019/3/18 16:34
	  *
	  *  * @Param: aid
	   * @Param: aditime
	  * @return int
	  */
	public int addUp(int aid, Timestamp aditime) {
		String sql = "insert into adlogin(aid, aditime,adotime) values(?,?,?)";		//登出时间默认是登入时间，登出时再另行修改
		int n = DBUtil.update(sql, aid, aditime, aditime);
		return n;
	}

	 /**
	  * create by: yonyong
		  * description: 查询某个管理员登陆
	  * create time: 2019/3/18 16:37
	  *
	  *  * @Param: aid
	   * @Param: aditime
	  * @return cn.yonyong.mytwitter.pojo.Adlogin
	  */
	public Adlogin selSignal(int aid, Timestamp aditime) {
		String sql = "select adid,aid,aditime,adotime from adlogin where aid=? and aditime=?";
		List<Adlogin> list = DBUtil.query(Adlogin.class, sql, aid, aditime);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	 /**
	  * create by: yonyong
	  * description: 更新管理员登出时间
	  * create time: 2019/3/18 16:38
	  *
	  *  * @Param: adid
	   * @Param: adotime
	  * @return int
	  */
	public int updateSignin(int adid, Timestamp adotime) {
		String sql = "update adlogin set adotime=? where adid=? ";
		int n = DBUtil.update(sql, adotime, adid);
		return n;
	}
}
