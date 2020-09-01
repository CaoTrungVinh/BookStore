package controller.tool;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;
import javax.swing.JFileChooser;

import java.awt.event.ActionListener;
import java.io.File;
import java.awt.event.ActionEvent;

public class Tool extends JFrame {
    File file;
    String path_File;

    private JPanel contentPane;

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
        contentPane.setLayout(null);

        JButton btnNewButton = new JButton("Public key file");
        btnNewButton.setBounds(144, 86, 200, 23);
        contentPane.add(btnNewButton);

        JButton btnFileData = new JButton("Choose file signature");
        btnFileData.setBounds(144, 120, 200, 23);
        contentPane.add(btnFileData);

        JButton btnNewButton_1 = new JButton("Signature");
        btnNewButton_1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
            }
        });
        btnNewButton_1.setBounds(313, 209, 150, 23);
        contentPane.add(btnNewButton_1);

        btnNewButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                JFileChooser fileChooser = new JFileChooser();
                fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
                int status = fileChooser.showOpenDialog(null);
                fileChooser.setAcceptAllFileFilterUsed(false);
                if (status == JFileChooser.APPROVE_OPTION) {
                    file = fileChooser.getSelectedFile();
                    path_File = file.getAbsolutePath();
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
                    path_File = file.getAbsolutePath();
                    JOptionPane.showMessageDialog(contentPane, "Choose File success", "Success",
                            JOptionPane.INFORMATION_MESSAGE);
                }
            }
        });
        btnNewButton_1.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
            }
        });
    }
}
