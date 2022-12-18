<%@ page import="java.io.File" %>
<%@ page import="java.io.FileFilter" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://merikyan.com</loc>
    <lastmod>2022-12-18</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
   </url>
   <url>
     <loc>https://merikyan.com/pages/news/newslist.jsp</loc>
     <lastmod>2022-12-18</lastmod>
     <changefreq>monthly</changefreq>
     <priority>0.8</priority>
    </url>
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

                      <%
                        // Loop through the sorted files array and print the names and creation dates of the files
                        int j = 1;
                        for (File file : files) {
                          SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

                          // Format the date and store it in a variable
                          String formattedDate = formatter.format(new Date(file.lastModified()));
                      %>
                      <url>
                        <loc>https://merikyan.com/pages/news/published/<%= file.getName() %> ><%= file.getName().replace("_", " ").replace(".html", "") %></loc>
                        <lastmod><%= formattedDate %></lastmod>
                        <changefreq>monthly</changefreq>
                        <priority>0.8</priority>
                       </url>
                      <%
                        }
                      %>
</urlset>
