package datasolve;

public class Main {
	public static void main(String args[]){
		/*
		 * data solve process
		 */
		//String filename1 = "data\\source\\gene_association_2016_2_11.mgi";
		//String filename2 = "data\\source\\gene_association_2016_1_21.goa_human";
		//String filename3 = "data\\source\\go_2016_2_19.obo.txt";
		//String filename4 = "data\\source\\MPheno_OBO_2016_2_5.ontology";
		//String filename5 = "data\\source\\MGI_Geno_Disease_2016_2_21.rpt";
		//String filename6 = "data\\source\\MGI_EntrezGene_2016_2_21.rpt";
		//String filename7 = "data\\source\\BIOGRID-ORGANISM-Homo_sapiens-3.4.133_2016_2_21.tab2.txt";
		//String filename8 = "data\\source\\BIOGRID-ORGANISM-Mus_musculus-3.4.133_2016_2_21.tab2.txt";
		//String filename9 = "data\\source\\morbidmap_old";
		//String filename10 = "data\\source\\gene2go_2016_2_22";
		//String filename11 = "data\\source\\mim2gene_medgen_2016_2_22";
		//String filename12 = "data\\source\\HOM_MouseHumanSequence_2016_2_23.rpt";
		//String filename13 = "data\\source\\morbidmap_2016_2_24.txt";
		//String result1 = "data\\result\\mgi_go_2016_2_18.txt";
		//String result2 = "data\\result\\human_go_2016_2_18.txt";
		//String result3 = "data\\result\\go_2016_2_19.txt";
		//String result4 = "data\\result\\MPO_2016_2_5.txt";
		//String result6 = "data\\result\\MGI_Gene_2016_2_5.txt";
		//String result7 = "data\\result\\Human_ppi_2016_2_21.txt";
		//String result8 = "data\\result\\Mus_ppi_2016_2_21.txt";
		//String result9 = "data\\result\\human_gp_old_2016_2_22.txt";
		//String result10 = "data\\result\\human_gene_go_2016_2_22.txt";
		//String result11 = "data\\result\\human_omim_ncbi_2016_2_22.txt";
		//String result12 = "data\\result\\mus_human_ncbi_2016_2_23.txt";
		//String result13 = "data\\result\\human_omim_omim_2016_2_24.txt";
 		//FileOperator.WriteFile(FileOperator.ReadFile(filename1, 'M', new String[]{"\t", ":"}, new int[]{1, 4}), result1);
 		//FileOperator.WriteFile(FileOperator.ReadFile(filename2, 'U', new String[]{"\t", ":"}, new int[]{2, 4}), result2);
		//FileOperator.WriteFile(FileOperator.ReadFile(filename3, "[Term]", "[Typedef]"),  result3);
		//FileOperator.WriteFile(FileOperator.ReadFile(filename4, "[Term]", "[Typedef]"),  result4);
		//FileOperator.WriteFile(FileOperator.ReadFile(filename5, '0', new String[]{"\t", ":"}, new int[]{4, 6}), result5);
		//FileOperator.WriteFile(FileOperator.ReadFile(filename6, '0', new String[]{"\t", ":"}, new int[]{0, 8}), result6);
		//FileOperator.WriteFile(FileOperator.CutHead(FileOperator.ReadFile(filename7, '0', new String[]{"\t", ":"}, new int[]{1, 2})), result7);
		//FileOperator.WriteFile(FileOperator.CutHead(FileOperator.ReadFile(filename8, '0', new String[]{"\t", ":"}, new int[]{1, 2})), result8);
		//FileOperator.WriteFile(FileOperator.ReadFile(filename10, '9', '6', new String[]{"\t", ":"}, new int[]{1, 2}), result10);
		//FileOperator.WriteFile(FileOperator.SpecialReadFile(filename9), result9);
		//FileOperator.WriteFile(FileOperator.BlcoksReadFile(filename11), result11);
		//FileOperator.WriteFile(FileOperator.ReadHomFile(filename12), result12);
		//FileOperator.WriteFile(FileOperator.SpecialReadFile(filename13), result13);
		/*
		 * data solve process
		 */
		
		/*
		 * make tree process
		 */
		//String filename = "data\\result\\MPO_2016_2_5.txt";
		//String result = "data\\result\\MPO_tree_2016_2_5.txt";
		//String filename1 = "data\\result\\go_2016_2_19.txt";
		//String result1 = "data\\result\\GO_tree_2016_2_19.txt";
		//TreeMaker treeMaker = new TreeMaker();
		//HashSet<Integer> id = treeMaker.Init(FileOperator.ReadTuple(filename1));
		//treeMaker.BigLoop(id, treeMaker);
		//treeMaker.save(result1);
		/*
		 * make tree process
		 */
		
		/*
		 * human omim2ncbi merger
		 */
		//String filename1 = "data\\source\\omim2ncbi";
		//String filename2 = "data\\source\\omim2ncbi_2016_2_24.txt";
		//String result = "data\\result\\omim2ncbi_merge_2016_2_24.txt";
		//ArrayList<Tuple> a1 = DataSolve.DataTrans(FileOperator.ReadTuple(filename1));
		//ArrayList<Tuple> a2 = DataSolve.DataTrans(FileOperator.ReadTuple(filename2));
		//FileOperator.WriteFile(DataSolve.MapToString(DataSolve.Merge(a1, a2)), result);
		/*
		 * human omim2ncbi merger
		 */
		
		/*
		 * pathway file format
		 */
		//String filename1 = "data\\source\\pathway_mmu_mgi_sec.txt";
		//String filename2 = "data\\source\\pathway_mmu_ncbi_sec.txt";
		//String result1 = "data\\result\\pathway_mmu_mgi_sec_2015_2_24.txt";
		//String result2 = "data\\result\\pathway_mmu_ncbi_sec_2015_2_24.txt";
		//FileOperator.WriteFile(DataSolve.Foramt(FileOperator.ReadTuple(filename1, ",")), result1);
		//FileOperator.WriteFile(DataSolve.Foramt(FileOperator.ReadTuple(filename2, ",")), result2);
		
		//String filename3 = "data\\source\\pathway_hsa_omim_sec.txt";
		//String filename4 = "data\\source\\pathway_hsa_ncbi_sec.txt";
		//String result3 = "data\\result\\pathway_hsa_omim_sec_2015_2_24.txt";
		//String result4 = "data\\result\\pathway_hsa_ncbi_sec_2015_2_24.txt";
		//FileOperator.WriteFile(DataSolve.Foramt(FileOperator.ReadTuple(filename3, ",")), result3);
		//FileOperator.WriteFile(DataSolve.Foramt(FileOperator.ReadTuple(filename4, ",")), result4);
		/*
		 * pathway file format
		 */
	}
}
