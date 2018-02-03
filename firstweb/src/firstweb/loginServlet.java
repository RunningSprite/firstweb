package firstweb;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();//��ȡsession
		Object name = session.getAttribute("name");//��session�л�ȡ�û���
		Object pwd = session.getAttribute("pwd");//��session��ȡ�û�����
		System.out.println(name+":"+pwd); //����һ�£������ȡ���û���������
		session.invalidate(); //ע��session
		response.sendRedirect("login.jsp"); //��ת��login.jspҳ��
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// doGet(request, response);
		// ���ñ���Ϊutf-8
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		// ��ȡ�û���������
		String name = request.getParameter("uname");
		String pwd = request.getParameter("pwd");

		// У���û����������Ƿ���ȷ
		if ("admin".equals(name) && "123".equals(pwd)) {// ��֤�ɹ�
			HttpSession session = request.getSession();//��ȡsession
			session.setAttribute("name", name);// ���û��������뱣����session��
			session.setAttribute("pwd", pwd);// ���û��������뱣����session��
			response.sendRedirect("success.jsp");// ��ת��success.jspҳ��
		} else {// У�鲻�ɹ�����������ת��login.jspҳ��
			response.sendRedirect("login.jsp");
		}
	}

}


