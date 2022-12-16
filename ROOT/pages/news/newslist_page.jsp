<%@ page import="java.io.File" %>
<%@ page import="java.io.FileFilter" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Date" %>




                    <%
                      // Define the directory where the files are located
                      String directory = "/var/lib/tomcat9/webapps5/ROOT/pages/news/published";

                      // Create a File object for the directory
                      File dir = new File(directory);

                      // Use the listFiles method to get an array of File objects for the files in the directory
                      File[] files = dir.listFiles(new FileFilter() {
                        @Override
                        public boolean accept(File pathname) {
                          // Accept only files (not directories)
                          return pathname.isFile();
                        }
                      });

                      // Sort the files array by the date the files were created
                      Arrays.sort(files, new Comparator<File>() {
                        @Override
                        public int compare(File file1, File file2) {
                          // Compare the creation dates of the two files
                          return Long.compare(file1.lastModified(), file2.lastModified());
                        }
                      });
                    %>

                    <ul>
                      <%
                        // Loop through the sorted files array and print the names and creation dates of the files
                        int j = 1;
                        %><%=files.length%>
                        <%
                        for (File file : files) {

                      %>
                      <li><%=j+""%> <a href=published/<%= file.getName() %> ><%= file.getName().replace("_", " ").replace(".html", "") %></a>
                          <BR>
                          <% j +=1;%>
                          <hr style="border-color: lightblue;">
                          <%= new Date(file.lastModified()) %>
                          <hr style="border-color: black;">
                          <BR><BR>
                       </li>
                      <%
                        }
                      %>
                    </ul>
