//import java.io.File;
//import java.io.FileInputStream;
//import java.io.InputStreamReader;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import java.sql.Clob;
//import java.util.Base64;
//
//public class BLOB{
//    public static void main(String[] args) {
//        String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
//        String username = "root";
//        String password = "Do!ng123";
//        String imagePath = "C:\\Users\\karta\\Desktop\\鮮奶茶.jpg"; // 新图像文件路径
//        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
//            // 读取图像文件并将其转换为Base64编码的字符串
//            File imageFile = new File(imagePath);
//            FileInputStream fis = new FileInputStream(imageFile);
//            byte[] imageBytes = new byte[(int) imageFile.length()];
//            fis.read(imageBytes);
//            fis.close();
//            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
//
//            // 使用 PreparedStatement 更新第三行的 CLOB 列
//            String sql = "UPDATE product_table SET picture = ? WHERE id = 8";
//            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
//                Clob clobData = connection.createClob();
//                clobData.setString(1, base64Image);
//                preparedStatement.setClob(1, clobData);
//                preparedStatement.executeUpdate();
//            }
//
//            System.out.println("Image updated successfully as CLOB.");
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//}
