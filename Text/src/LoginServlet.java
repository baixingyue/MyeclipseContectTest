import java.sql.* ;
import java.io.* ;
import javax.servlet.http.* ;
import javax.servlet.* ;
public class LoginServlet extends HttpServlet implements Servlet{
 public LoginServlet(){
 }
 
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
 
 }
// protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//  System.out.println("-------------------------") ;
//  doPost(request, response) ;
// }
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
  response.setContentType("text/html;charset=gb2312") ;
  request.setCharacterEncoding("gb2312") ;
  String result = "" ;
  //��ȡ�û���
  String username = request.getParameter("username") ;
  String psw = request.getParameter("password") ;
  if ((username == "") || (username==null) || (username.length() > 20 )){
   try{
    result = "�������û���(���ܳ���20���ַ�)!" ;
    request.setAttribute("message" ,result) ;
    response.sendRedirect("login.jsp") ;
   }catch(Exception e){
    e.printStackTrace() ;
   }
  }
  if ((psw == "") || (psw==null) || (psw.length() > 20 )){
   try{
    result = "����������(���ܳ���20���ַ�)!" ;
    request.setAttribute("message" ,result) ;
    response.sendRedirect("login.jsp") ;
   }catch(Exception e){
    e.printStackTrace() ;
   }
  }
  
  //�Ǽ�JDBC��������
  try{
   Class.forName("org.gjt.mm.mysql.Driver") ;
  }catch(ClassNotFoundException e){
   e.printStackTrace() ;
   System.out.println("Class Not Found Exception . ") ;
  }
  //����URL
  String url ="jdbc:mysql://localhost:3306/learnJSP" ;
  Connection conn = null ;
  Statement stmt = null ;
  ResultSet rs = null ;
  
  try{
   conn = DriverManager.getConnection(url, "root", "root") ;
   stmt = conn.createStatement() ;
   //SQL���
   String sql ="select * from userInfo where username='"+username+"' and userpsw= '"+psw+"'" ;
   rs = stmt.executeQuery(sql) ;//���ز�ѯ���
  }catch(SQLException e){
   e.printStackTrace() ;
  }
   HttpSession session =  request.getSession() ;
   session.setAttribute("username", username) ;
   //System.out.println("+++++++++++++++++++++++"+ username) ;
  try{
   if (rs.next()){ //�����¼���ǿգ�������ƥ����û��������룬��½�ɹ�
       // ��¼�ɹ���username����Ϊsession������username
          // �����ں���Ϳ���ͨ�� session.getAttribute("username") ����ȡ�û�����
          // ͬʱ������������Ϊ�û���¼�����ж�����
    session.setAttribute("age",rs.getString("age")) ;
    session.setAttribute("sex",rs.getString("sex")) ;
    session.setAttribute("weight",rs.getString("weight")) ;
    response.sendRedirect("success.jsp") ;
   }else{
    session.setAttribute("message", "�û��������벻ƥ�䡣");
    response.sendRedirect("fail.jsp") ;
   }
  }catch(SQLException e){
   e.printStackTrace() ;
  }
 }
 
 private static final long serialVersionUID = 1L;
}