script_name="$1"
base_path="/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI"

subject_list_file="${base_path}/scripts/n_files.txt"

sbatch_script_path="${base_path}/scripts/cluster/${script_name}"

mkdir -p sbatch_script_path

# Create script

while IFS= read -r line; do 
    filename="${sbatch_script_path}/${line}.sbatch"
    touch filename
    echo "#!bin/env bash" >> "$filename"
    echo "#SBATCH --job-name=${line}_${script_name}" >> "$filename"
    echo "#SBATCH --output=${sbatch_script_path}/${script_name}.out" >> "$filename"
    echo "#SBATCH --error=${sbatch_script_path}/${script_name}.err" >> "$filename"
    echo "#SBATCH --partition=defq" >> "$filename"
    echo "#SBATCH --nodes=1" >> "$filename"
    echo "#SBATCH --cpus-per-task=4" >> "$filename"
    echo "#SBATCH --mem-per-cpu=8096" >> "$filename"
    echo "#SBATCH --ntasks=1" >> "$filename"
    echo "#SBATCH --time=12:00:00" >> "$filename"
    echo "module load matlab" >> "$filename"
    echo "matlab -nodisplay -nosplash -r \"addpath(genpath('${base_path}/scripts')); ${script_name}(${line})\"" >> "$filename";

    sbatch "$filename"

done < subject_list_file

