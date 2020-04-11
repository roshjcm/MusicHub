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
import javax.swing.JRadioButton;


public class RegisterGUI implements ActionListener {
	
	private static JFrame frame;
	private static JPanel panel;
	private static JLabel title;
	
	private static JRadioButton ArtistButton;
	private static JRadioButton listenerButton;
	
	private static JLabel nameLabel;
	private static JTextField nameText;
	
	private static JLabel stageName;
	private static JTextField stageNameText;
	
	private static JLabel usernameLabel;
	private static JTextField usernameText;
	
	private static JLabel countryLabel;
	private static JTextField countryText;
	
	private static JLabel emailLabel;
	private static JTextField emailText;
	
	private static JLabel dobLabel;
	private static JTextField dobText;
	
	private static JLabel credit_infoLabel;
	private static JTextField credit_infoText;
	
	private static JLabel passwordLabel;
	private static JPasswordField passwordText;
	
	private static JButton signupButton;
	private static JLabel success;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new RegisterGUI();

	}
	
	public RegisterGUI() {
		frame = new JFrame();  // the window
		panel = new JPanel();

		title = new JLabel("Please fill in the information below :");
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
		frame.setTitle("Registration");

		listenerButton = new JRadioButton("Listener");
		//listenerButton.setMnemonic(KeyEvent.VK_L);
		listenerButton.setActionCommand("Listener");
		listenerButton.addActionListener(this);
		listenerButton.setSelected(true);
		panel.add(listenerButton);
		
		ArtistButton = new JRadioButton("Artist");
		//ArtistButton.setMnemonic(KeyEvent.VK_A);
		ArtistButton.setActionCommand("Artist");
		ArtistButton.addActionListener(this);
		panel.add(ArtistButton);
	    
		nameLabel = new JLabel("Full Name");
		nameLabel.setBounds(10,20,80,25);
		panel.add(nameLabel);
		nameText = new JTextField(20);
		nameText.setBounds(100,20,165,25);
		panel.add(nameText);
		
		usernameLabel = new JLabel("Username");
		usernameLabel.setBounds(10,20,80,25);
		panel.add(usernameLabel);
		usernameText = new JTextField(20);
		usernameText.setBounds(100,20,165,25);
		panel.add(usernameText);
		
		emailLabel = new JLabel("Email");
		emailLabel.setBounds(10,20,80,25);
		panel.add(emailLabel);
		emailText = new JTextField(20);
		emailText.setBounds(100,20,165,25);
		panel.add(emailText);

		passwordLabel = new JLabel("Password");
		passwordLabel.setBounds(10,50,80,25);
		panel.add(passwordLabel);
		passwordText = new JPasswordField(20);
		passwordText.setBounds(100,50,165,25);
		panel.add(passwordText);
		
		countryLabel = new JLabel("Country");
		countryLabel.setBounds(10,20,80,25);
		panel.add(countryLabel);
		countryText = new JTextField(20);
		countryText.setBounds(100,20,165,25);
		panel.add(countryText);
		
		dobLabel = new JLabel("Date of Birth : YYYY-MM-DD");
		dobLabel.setBounds(10,20,80,25);
		panel.add(dobLabel);
		dobText = new JTextField(20);
		dobText.setBounds(100,20,165,25);
		panel.add(dobText);
		
		credit_infoLabel = new JLabel("Credit information");
		credit_infoLabel.setBounds(10,20,80,25);
		panel.add(credit_infoLabel);
		credit_infoText = new JTextField(20);
		credit_infoText.setBounds(100,20,165,25);
		panel.add(credit_infoText);

		signupButton = new JButton("Sign Up");
		signupButton.setBounds(10, 80, 80, 25);
		signupButton.setActionCommand("register");
		signupButton.addActionListener(this);
		panel.add(signupButton);

		success = new JLabel("");
		success.setBounds(10, 110, 300, 25);
		panel.add(success);

		frame.pack();
		frame.setVisible(true);

	}
	public void actionPerformed(ActionEvent e) {
		
		if ("Artist".equals(e.getActionCommand())) {
			listenerButton.setSelected(false);
			
			stageName = new JLabel("Stage Name");
			stageName.setBounds(10,20,80,25);
			//panel.add(stageName);
			stageNameText = new JTextField(20);
			stageNameText.setBounds(100,20,165,25);
		
			panel.add(stageName, 3);
			panel.add(stageNameText, 4);
			
			panel.revalidate();
			frame.revalidate();
			frame.repaint();
			
		} else if ("Listener".equals(e.getActionCommand())) {
			ArtistButton.setSelected(false);
			panel.remove(stageName);
			panel.remove(stageNameText);
			panel.revalidate();
			frame.revalidate();
			frame.repaint();
		}
		else {
			frame.setVisible(false);
			frame.dispose();
			//System.exit(0);
		}
	}

}
