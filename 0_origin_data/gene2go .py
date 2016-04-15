f=open('gene2go','r')
f2=open('gene2go_hsa','w')
f3=open('gene2go_mmu','w')
for line in f.readlines():
	if line.split()[0]=='9606':
		f2.write(line.split()[1])
		f2.write(' ')
		f2.write(line.split()[2][3:10])
		f2.write('\n')
	elif line.split()[0]=='10090':
		f3.write(line.split()[1])
		f3.write(' ')
		f3.write(line.split()[2][3:10])
		f3.write('\n')

