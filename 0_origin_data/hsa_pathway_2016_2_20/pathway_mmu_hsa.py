f_hsa=open('id_hsa.txt','r')
f=open('a','w')
hsa=0
s=0
for line_hsa in f_hsa.readlines():
	hsa=hsa+1
	mmu=0
	print line_hsa[3:8]
	f_mmu=open('id_mmu.txt','r')
	for line_mmu in f_mmu.readlines():
		mmu=mmu+1
		if line_hsa[3:8]==line_mmu[3:8]:
			f.write(str(hsa))
			f.write(' ')
			f.write(str(mmu))
			f.write('\n')


