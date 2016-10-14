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
  //获取用户名
  String username = request.getParameter("username") ;
  String psw = request.getParameter("password") ;
  if ((username == "") || (username==null) || (username.length() > 20 )){
   try{
    result = "请输入用户名(不能超过20个字符)!" ;
    request.setAttribute("message" ,result) ;
    response.sendRedirect("login.jsp") ;
   }catch(Exception e){
    e.printStackTrace() ;
   }
  }
  if ((psw == "") || (psw==null) || (psw.length() > 20 )){
   try{
    result = "请输入密码(不能超过20个字符)!" ;
    request.setAttribute("message" ,result) ;
    response.sendRedirect("login.jsp") ;
   }catch(Exception e){
    e.printStackTrace() ;
   }
  }
  
  //登记JDBC驱动程序
  try{
   Class.forName("org.gjt.mm.mysql.Driver") ;
  }catch(ClassNotFoundException e){
   e.printStackTrace() ;
   System.out.println("Class Not Found Exception . ") ;
  }
  //连接URL
  String url ="jdbc:mysql://localhost:3306/learnJSP" ;
  Connection conn = null ;
  Statement stmt = null ;
  ResultSet rs = null ;
  
  try{
   conn = DriverManager.getConnection(url, "root", "root") ;
   stmt = conn.createStatement() ;
   //SQL语句
   String sql ="select * from userInfo where username='"+username+"' and userpsw= '"+psw+"'" ;
   rs = stmt.executeQuery(sql) ;//返回查询结果
  }catch(SQLException e){
   e.printStackTrace() ;
  }
   HttpSession session =  request.getSession() ;
   session.setAttribute("username", username) ;
   //System.out.println("+++++++++++++++++++++++"+ username) ;
  try{
   if (rs.next()){ //如果记录集非空，表明有匹配的用户名和密码，登陆成功
       // 登录成功后将username设置为session变量的username
          // 这样在后面就可以通过 session.getAttribute("username") 来获取用户名，
          // 同时这样还可以作为用户登录与否的判断依据
    session.setAttribute("age",rs.getString("age")) ;
    session.setAttribute("sex",rs.getString("sex")) ;
    session.setAttribute("weight",rs.getString("weight")) ;
    response.sendRedirect("success.jsp") ;
   }else{
    session.setAttribute("message", "用户名或密码不匹配。");
    response.sendRedirect("fail.jsp") ;
   }
  }catch(SQLException e){
   e.printStackTrace() ;
  }
 }
 
 private static final long serialVersionUID = 1L;
}