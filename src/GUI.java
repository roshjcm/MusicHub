import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import java.awt.BorderLayout;
import java.awt.GridLayout;

public class GUI implements ActionListener {
	
	private int count = 0;
	private JLabel title, caption;
	private JPanel panel;
	private JFrame frame;
	private JButton button;
	
	
	public GUI () {
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
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		count++;
		caption.setText("# of clicks: " + count);
	}
}
