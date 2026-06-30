data = [
        ('G', 'Gamma'),
        ('D', 'Delta'),
        ('Q', 'Theta'),
        ('L', 'Lambda'),
        ('P', 'Pi'),
        ('S', 'Sigma'),
        ('U', 'Upsilon'),
        ('F', 'Phi'),
        ('Y', 'Psi'),
        ('W', 'Omega'),
        ]

for (foo, bar) in data:
    print(f"""context "math()"
snippet '{foo} "{bar}" iA
\\\\{bar}
endsnippet
""")
