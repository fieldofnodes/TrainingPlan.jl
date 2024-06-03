using TrainingPlan
using Documenter

DocMeta.setdocmeta!(TrainingPlan, :DocTestSetup, :(using TrainingPlan); recursive=true)

makedocs(;
    modules=[TrainingPlan],
    authors="Jonathan Miller jonathan.miller@fieldofnodes.com",
    sitename="TrainingPlan.jl",
    format=Documenter.HTML(;
        canonical="https://fieldofnodes.github.io/TrainingPlan.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/fieldofnodes/TrainingPlan.jl",
    devbranch="main",
)
