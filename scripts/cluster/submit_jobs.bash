script_name="$1"
base_path="/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/"

subject_list_file="${base_path}scripts/n_files.txt"

sbatch_script_path="${base_path}scripts/cluster/${script_name}"

mkdir -p sbatch_script_path

# Create script

while IFS= read -r line; do 
    filename="${sbatch_script_path}/${line}.sbatch"
    touch filename
    "#!bin/env bash" >> filename
    "#SBATCH --job-name=${line}_${script_name}" >> filename
    "#SBATCH --output=${sbatch_script_path}/${script_name}.out" >> filename
    "#SBATCH --error=${sbatch_script_path}/${script_name}.err" >> filename
    "#SBATCH --partition=defq" >> filename
    "#SBATCH --nodes=1" >> filename
    "#SBATCH --cpus-per-task=4" >> filename
    "#SBATCH --mem-per-cpu=8096" >> filename
    "#SBATCH --ntasks=1" >> filename
    "#SBATCH --time=12:00:00" >> filename
    "module load matlab" >> filename
    ""

done < subject_list_file

