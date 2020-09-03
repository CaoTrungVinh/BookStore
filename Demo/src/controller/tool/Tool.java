package controller.tool;
import java.awt.*;

import javax.swing.*;
import javax.swing.border.EmptyBorder;

import java.awt.event.ActionListener;
import java.io.File;
import java.awt.event.ActionEvent;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.util.Base64;

public class Tool extends JFrame {
    File file;
    String path_File_Private;
    String path_File_Data;
    private JPanel contentPane;
    private JTextArea tfSignature;

    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    Tool frame = new Tool();
                    frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    public Tool() {

        setTitle("Tool Signature");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 450, 300);
        contentPane = new JPanel();
        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
        setContentPane(contentPane);
        contentPane.setLayout(new BoxLayout(contentPane, BoxLayout.Y_AXIS));


        JButton btnPrivate = new JButton("Private key file");
//        btnPrivate.setBounds(144, 86, 200, 23);
        contentPane.add(btnPrivate);

        JButton btnFileData = new JButton("Choose file signature");
//        btnFileData.setBounds(144, 120, 200, 23);
        contentPane.add(btnFileData);

        JPanel result = new JPanel();
        result.setLayout(new BoxLayout(result, BoxLayout.X_AXIS));


        Label lb = new Label("Signature");
        result.add(lb);
//        lb.setBounds(100, 220, 150, 23);
        tfSignature = new JTextArea(5,40);
        tfSignature.setLineWrap(true);
        tfSignature.setWrapStyleWord(true);
        result.add(tfSignature);

//        tx.setBounds(50, 250, 250, 25);

        contentPane.add(result);

        JButton btnSign = new JButton("Sign");
        btnSign.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
            }
        });
//        btnSign.setBounds(313, 300, 150, 23);
        contentPane.add(btnSign);

        btnPrivate.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                JFileChooser fileChooser = new JFileChooser();
                fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
                int status = fileChooser.showOpenDialog(null);
                fileChooser.setAcceptAllFileFilterUsed(false);
                if (status == JFileChooser.APPROVE_OPTION) {
                    file = fileChooser.getSelectedFile();
                    path_File_Private = file.getAbsolutePath();
                    btnPrivate.setText(file.getName());
                    JOptionPane.showMessageDialog(contentPane, "Choose Private key success", "Success",
                            JOptionPane.INFORMATION_MESSAGE);
                }
            }
        });

        btnFileData.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                JFileChooser fileChooser = new JFileChooser();
                fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
                int status = fileChooser.showOpenDialog(null);
                fileChooser.setAcceptAllFileFilterUsed(false);
                if (status == JFileChooser.APPROVE_OPTION) {
                    file = fileChooser.getSelectedFile();
                    path_File_Data = file.getAbsolutePath();
                    btnFileData.setText(file.getName());
                    JOptionPane.showMessageDialog(contentPane, "Choose File success", "Success",
                            JOptionPane.INFORMATION_MESSAGE);
                }
            }
        });
        btnSign.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                Sign sign = new Sign();
                try {
                 byte [] signature =   sign.signature(new File(path_File_Private), new File(path_File_Data));
                String str = Base64.getEncoder().encodeToString(signature);
                    tfSignature.setText(str);


                } catch (NoSuchProviderException noSuchProviderException) {
                    noSuchProviderException.printStackTrace();
                } catch (NoSuchAlgorithmException noSuchAlgorithmException) {
                    noSuchAlgorithmException.printStackTrace();
                } catch (IOException ioException) {
                    ioException.printStackTrace();
                } catch (InvalidKeySpecException invalidKeySpecException) {
                    invalidKeySpecException.printStackTrace();
                } catch (InvalidKeyException invalidKeyException) {
                    invalidKeyException.printStackTrace();
                } catch (SignatureException signatureException) {
                    signatureException.printStackTrace();
                }
            }

        });
    }
}
