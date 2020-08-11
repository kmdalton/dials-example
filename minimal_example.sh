SG=19

dials.import \
    geometry.scan.oscillation=0,0.25    \
    geometry.goniometer.axis=0,1,0   \
    geometry.beam.wavelength=1.306472  \
    geometry.detector.panel.pixel_size=0.08854,0.08854 \
    input.template=images/1_#####.tiff \
    input.template=images/2_#####.tiff \
    input.template=images/3_#####.tiff \
    input.template=images/4_#####.tiff 

dials.find_spots imported.expt \
    spotfinder.threshold.dispersion.gain=0.46 \
    spotfinder.threshold.dispersion.global_threshold=20 \
    spotfinder.filter.min_spot_size=2 \
    spotfinder.filter.d_min=1.7 \
    spotfinder.filter.d_max=18

dials.combine_experiments imported.expt strong.refl \
    reference_from_experiment.beam=0 \
    reference_from_experiment.scan=0 \
    reference_from_experiment.detector=0 \
    reference_from_experiment.goniometer=0 

dials.index combined.expt combined.refl \
    refinement.parameterisation.beam.fix=all \
    refinement.parameterisation.detector.fix=all \
    refinement.parameterisation.goniometer.fix=all \
    indexing.known_symmetry.space_group=$SG 

dials.refine indexed.*
