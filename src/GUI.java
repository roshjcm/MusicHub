import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import java.awt.BorderLayout;
import java.awt.GridLayout;
import javax.swing.JTextField;
import javax.swing.JPasswordField;

public class GUI implements ActionListener {

	private static JFrame frame;
	private static JPanel panel;
	private static JLabel title;
	private static JLabel userLabel;
	private static JTextField userText;
	private static JLabel passwordLabel;
	private static JPasswordField passwordText;
	private static JButton loginButton;
	private static JButton signupButton;
	private static JLabel success;
	
	/* public GUI () {
		frame = new JFrame();  // the window
		panel = new JPanel();
		
		title = new JLabel("Welcome to the MusicHub! Which option would you like to pick?");
		caption = new JLabel("# of clicks: 0");
		button = new JButton("Click me");
		button.addActionListener(this);
		
		
		panel.setBorder(BorderFactory.createEmptyBorder(30, 30, 10, 30));
		panel.setLayout(new GridLayout(0, 1));
		panel.add(title);
		panel.add(button);
		panel.add(caption);
		
		frame.add(panel, BorderLayout.CENTER);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setTitle("Music Hub");
		
		frame.pack();
		frame.setVisible(true);
		
	} */

	public static void main(String[] args)
	{
		frame = new JFrame();  // the window
		panel = new JPanel();

		title = new JLabel("Welcome to the MusicHub! Please login to continue");
		//JLabel caption = new JLabel("# of clicks: 0");
		//JButton button = new JButton("Click me");
		//button.addActionListener(this);

		panel.setBorder(BorderFactory.createEmptyBorder(30, 30, 10, 30));
		panel.setLayout(new GridLayout(0, 1));
		panel.add(title);
		//panel.add(button);
		//panel.add(caption);

		frame.add(panel, BorderLayout.CENTER);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setTitle("Music Hub");



		userLabel = new JLabel("Email");
		userLabel.setBounds(10,20,80,25);
		panel.add(userLabel);
		userText = new JTextField(20);
		userText.setBounds(100,20,165,25);
		panel.add(userText);


		passwordLabel = new JLabel("Password");
		passwordLabel.setBounds(10,50,80,25);
		panel.add(passwordLabel);
		passwordText = new JPasswordField(20);
		passwordText.setBounds(100,50,165,25);
		panel.add(passwordText);


		loginButton = new JButton("Login");
		loginButton.setBounds(10, 80, 80, 25);
		loginButton.addActionListener(new GUI());
		panel.add(loginButton);

		signupButton = new JButton("Sign Up");
		signupButton.setBounds(10, 80, 80, 25);
		panel.add(signupButton);

		success = new JLabel("");
		success.setBounds(10, 110, 300, 25);
		panel.add(success);

		frame.pack();
		frame.setVisible(true);


	}
	@Override
	public void actionPerformed(ActionEvent e) {
		String user = userText.getText();
		String password = passwordText.getText();
		System.out.println(user + ", " + password);

		if(user.equals("maanav@test.com") && password.equals("testing123")) {
			success.setText("Login Successful!");
		}
		else {
			success.setText("The username or password is incorrect");
		}
	}
}
