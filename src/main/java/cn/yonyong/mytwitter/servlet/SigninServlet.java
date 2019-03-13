package cn.yonyong.mytwitter.servlet;

import cn.yonyong.mytwitter.dao.SigninDao;
import cn.yonyong.mytwitter.dao.UsersDao;
import cn.yonyong.mytwitter.pojo.Signin;
import cn.yonyong.mytwitter.pojo.Users;
import cn.yonyong.mytwitter.util.Times;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/signin.do")
public class SigninServlet extends HttpServlet {
	private UsersDao usersDao = new UsersDao();
	private SigninDao signinDao = new SigninDao();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String method = request.getParameter("method");

		if ("online".equals(method)) {
			toOnline(request, response);
		}
	}

	private void toOnline(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect("index.jsp");
			return;
		}

		int uid = user.getUid();
		int n = usersDao.updateOnline(1, uid);

		Timestamp stime = Times.getSystemTime();
		int m = signinDao.addUp(uid, stime);

		Signin signin = signinDao.selSignal(uid, stime);
		int sid = signin.getSid();
		session.setAttribute("signinid", sid);
		response.sendRedirect("main.jsp");
	}
}
