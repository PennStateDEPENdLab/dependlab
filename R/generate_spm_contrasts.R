#' This function reads an SPM.mat file and generate contrasts based on the design matrix specification
#'
#' @param output_dir location for SPM outputs and scripts for estimating contrasts. Must contain SPM.mat already
#' @param condition_contrasts see generate_spm_mat
#' @param unit_contrasts see generate_spm_mat
#' @param effects_of_interest_F see generate_spm_mat
#' @param spm_path see generate_spm_mat
#' @param execute whether to run contrast setup. This depends on SPM.mat having been created already. Default: FALSE
#' 
#' @importFrom R.matlab readMat
#' @author Michael Hallquist
#' @export
generate_spm_contrasts <- function(output_dir, condition_contrasts=TRUE, unit_contrasts=TRUE, effects_of_interest_F=TRUE,
                                   spm_path="/gpfs/group/mnh5174/default/lab_resources/spm12", execute=FALSE) {

  if (missing(output_dir)) { stop("No output_dir provided. This must be the folder containing the SPM.mat file") }
  if (execute && !file.exists(file.path(output_dir, "SPM.mat"))) { stop("No SPM.mat file found in: ", output_dir, ". This must be setup prior to estimating contrasts.") }

  if (condition_contrasts==FALSE && unit_contrasts==FALSE && effects_of_interest_F==FALSE) {
    message("No contrasts were requested by call to generate_spm_contrasts. As a result, nothing will occur here.")
    return(NULL)
  }

  spm_preamble <- c(
    ifelse(is.null(spm_path), "", paste0("addpath('", spm_path, "');")),
    "spm('defaults', 'fmri');",
    "spm_jobman('initcfg');",
    ""    
  )
  
  #get the names of all regressors
  mtmp <- file.path(output_dir, "extract_design_columns.m")
  mattmp <- file.path(output_dir, "design_columns.mat")
  mnames <- c(
    spm_preamble,
    paste0("load([ '", output_dir, "' filesep 'SPM.mat']);"),
    paste0("mnames=SPM.xX.name(:);"),
    paste0("cpos=SPM.xX.iC; %contrasts of design"),
    paste0("bpos=SPM.xX.iB; %block/run regressors"),
    paste0("npos=SPM.xX.iG; %nuisance regressors"),        
    paste0("save('", mattmp, "', 'mnames', 'cpos', 'bpos', 'npos');")
  )
  cat(mnames, file=mtmp, sep="\n")

  extract_cmd <- paste0("module load matlab/R2017b; matlab -nodisplay -r \"run('", mtmp, "');exit;\"")
  if (execute) {
    system(extract_cmd)
  }

  setup_script <- system.file("Rscript", "setup_spm_contrasts.R", package="dependlab")
  stopifnot(file.exists(setup_script))

  rscript_cmd <- paste0("Rscript --no-save --no-restore ", setup_script,
    " -mat_file ", mattmp,
    " -condition_contrasts ", as.character(condition_contrasts),
    " -unit_contrasts ", as.character(unit_contrasts),
    " -effects_of_interest_F ", as.character(effects_of_interest_F),
    " -spm_path ", spm_path)

  if (execute) {
    system(rscript_cmd)
  }

  return(list(extract_cmd=extract_cmd, setup_cmd=rscript_cmd))
}
