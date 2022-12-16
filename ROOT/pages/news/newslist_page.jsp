<%@ page import="java.io.File" %>
<%@ page import="java.io.FileFilter" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.TreeMap" %><%
                      // Define the directory where the files are located
                      Map<String, String> fileMap = new TreeMap<String, String>();
                      Vector<String>  fileList = new Vector<String>();
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

                        // Loop through the sorted files array and print the names and creation dates of the files
                        int j = 1;

                        for (File file : files) {
                          if(j > files.length - 50 ){
                            fileMap.put((new Date(file.lastModified())).toString(),file.getName());
                          }
                          j +=1;
                        }

                    for (String key : fileMap.keySet()) {
                      fileList.add(key);
                    }
                    j = 1;
                    for (int i = fileList.size() - 1; i >= 0; i--) {
                      String element = fileList.get(i);
                      %>

                      <div class="card text-center">
                        <div class="card-body">
                          <h5 class="card-title">
                          <a href=/pages/news/published/<%= fileMap.get(element) %> ><%= fileMap.get(element).replace("_", " ").replace(".html", "") %></a>
                          </h5>
                          <p class="card-text">
                          <%=element%>
                          </p>
                        </div>
                        <div class="card-footer">
                          <small class="text-muted">Featured Article <%=j+""%> of 50</small>
                        </div>
                        <img src="/pages/news/images/<%= fileMap.get(element) %>.png" class="card-img-right" alt="Card image">
                        <HR>
                      </div>

                      <%
                      j +=1;
                    }
                    %>
