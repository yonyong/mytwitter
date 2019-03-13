package cn.yonyong.mytwitter.util;

import cn.yonyong.mytwitter.dao.AdloginDao;
import cn.yonyong.mytwitter.dao.AdminsDao;
import cn.yonyong.mytwitter.dao.SigninDao;
import cn.yonyong.mytwitter.dao.UsersDao;
import cn.yonyong.mytwitter.pojo.Admins;
import cn.yonyong.mytwitter.pojo.Users;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.sql.Timestamp;

public class MySessionListener implements HttpSessionListener {
	private UsersDao usersDao = new UsersDao();
	private SigninDao signinDao = new SigninDao();
	private AdloginDao adloginDao = new AdloginDao();
	private AdminsDao adminsDao = new AdminsDao();

	@Override
	public void sessionCreated(HttpSessionEvent event) {

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			return;
		}
		ServletContext servletContext = event.getSession().getServletContext();
		servletContext.removeAttribute(((Users) session.getAttribute("user")).getUname());
		Integer onlineNum = (Integer) servletContext.getAttribute("onlineNum");
		if (onlineNum > 0) {
			servletContext.setAttribute("onlineNum", onlineNum - 1);
		}
		Object signinid = session.getAttribute("signinid");

		if (user == null || signinid == null) {
			return;
		}
		int uid = user.getUid();
		Timestamp sdtime = Times.getSystemTime();
		usersDao.updateOnline(0, uid);
		signinDao.updateSignin((Integer) signinid, sdtime);

		Object adid = session.getAttribute("adid");
		Admins admin = (Admins) session.getAttribute("admin");
		if (admin == null || adid == null) {
			return;
		}

		int aid = admin.getAid();
		adminsDao.updateOnline(0, aid);
		adloginDao.updateSignin((Integer) adid, sdtime);
	}

}
