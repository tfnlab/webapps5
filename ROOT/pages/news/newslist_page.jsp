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

                        for (File file : files) {
                          if(j > files.length - 50 ){
                      %>
                           <div class="card bg-light border-0 h-100">
                               <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                   <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-collection"></i></div>
                                   <h2 class="fs-4 fw-bold">
                                     <%=j+""%>
                                     <%= new Date(file.lastModified()) %>
                                     </h2>
                                   <p class="mb-0">
                                     <a href=published/<%= file.getName() %> ><%= file.getName().replace("_", " ").replace(".html", "") %></a>
                                   </p>
                               </div>
                           </div>
                      <%
                          }
                          j +=1;
                        }
                      %>
                    </ul>
