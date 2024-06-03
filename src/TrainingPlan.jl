module TrainingPlan


    using Revise
    using TrainingContent: TrainingTableData



export
    TrainingTableData,
    write_table_to_file,
    generate_table



    function generate_table_header()
        return """
        \\begin{center}
        {\\renewcommand{\\arraystretch}{1.5}%
        \\begin{longtable}{|ll|p{0.10\\linewidth}|p{0.80\\linewidth}|}
        \\hline
        \\textbf{Week} &  & \\textbf{Activity} & \\textbf{Title} \\\\
        \\hline
        \\endhead
    
        \\hline
        \\endfoot
        """
    end

    function generate_table_row(week_idx::Int, content_type::String, content_title::String)
        return "Week\t&\t$week_idx\t&\t$content_type\t&\t$content_title\t\\\\"
    end

    function generate_table_footer()
        return """
        \\hline
        \\end{longtable}}
        \\end{center}
        """
    end

    function generate_table(ttd::TrainingTableData)
        week_idx, content_type, content_title = ttd.week_idx, ttd.content_type, ttd.content_title
        contents = Base.OneTo(length(content_title))
        
        header = generate_table_header()
        rows = 
            [generate_table_row(week_idx[i], content_type[i], content_title[i]) for i in contents] |>
            x -> join(x,"\n")
        footer = generate_table_footer()
        
        return join([header,rows,footer], "\n")
    end

    function write_table_to_file(filename::String,ttd::TrainingTableData)
        table = generate_table(ttd)
        open(filename, "w") do file
            write(file, table)
        end
    end
end


