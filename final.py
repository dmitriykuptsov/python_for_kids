# -*- coding: utf-8 -*-
#!/usr/bin/python3

import tkinter as tk
class DiffUtil():
	def reverse_string(self, a):
		r = ""
		for i in range(len(a) - 1, -1, -1):
			r += a[i];
		return r;

	def diff(self, a, b):
		table = self.LCS(a, b);
		m = len(a); # (rows) 
		n = len(b); # (columns)
		r = "";
		while True:
			if n > 0 and m > 0 and a[m - 1] == b[n - 1]:
				r += a[m - 1];
				m = m - 1;
				n = n - 1;
			elif n > 0 and (m == 0 or table[m][n - 1] > table[m - 1][n]):
				r += "+" + b[n - 1];
				n = n - 1;
			elif m > 0 and (n == 0 or table[m][n - 1] <= table[m - 1][n]):
				r += "-" + a[m - 1];
				m = m - 1;
			else:
				break;
		return self.reverse_string(r);

	def LCS(self, a, b):
		table = [0] * (len(a) + 1);
		for i in range(0, len(a) + 1):
			table[i] = [0] * (len(b) + 1);
		max_length = 0;
		end = 0;
		for i in range(1, len(a) + 1):
			for j in range(1, len(b) + 1):
				if a[i - 1] == b[j - 1]:
					table[i][j] = table[i - 1][j - 1] + 1;
				else:
					table[i][j] = max(table[i][j - 1], table[i - 1][j])
		return table;

def compare(event):
	diff_util = DiffUtil();
	#print();
	left = text_box_left.get("1.0","end-1c");
	right = text_box_right.get("1.0","end-1c");
	result_left = "";
	result_right = "";
	for a, b in zip(left.split("\n"), right.split("\n")):
		diff = diff_util.diff(a, b)
		result_left += diff + "\n";

	text_box_left.delete(1.0, "end");
	text_box_left.insert(1.0, result_left);

window = tk.Tk();
window.title("Text diff utility");
text_box_left = tk.Text();
text_box_left.insert(1.0, u"This is my first string");
text_box_left.pack(side=tk.LEFT);
text_box_right = tk.Text();
text_box_right.insert(1.0, u"This is  my second string!");
text_box_right.pack(side=tk.RIGHT);
compare_button = tk.Button(text="<< Compare >>");
compare_button.bind('<Button-1>', compare)
compare_button.pack();
window.mainloop();
