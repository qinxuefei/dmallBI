# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


#可以下载的table
buildDTtable <- function(df, table.caption, page_len = 10){

    DT.table = DT::datatable(
        df,
        caption = table.caption, filter = 'top',
        extensions = 'Buttons',
        escape = FALSE,
        rownames = F,
        options = list(dom = 'Blfrtip',
                       pageLength = page_len,
                       lengthMenu = c(5, 10, 15, 20, 50),
                       buttons =
                           list('colvis', list(
                               extend = 'collection',
                               buttons = list(list(extend='csv',
                                                   filename = table.caption),
                                              list(extend='excel',
                                                   filename = table.caption),
                                              list(extend='copy',
                                                   text = '复制'
                                                   )),
                               text = 'Download'
                           )),
                       scrollX = TRUE,
                       scrollY = TRUE

        )
    )
    return(DT.table)
}

# 调整facet后ggplot图overlap问题。
layout_ggplotly <- function(gg, x = -0.05, y = -0.05){
    # The 1 and 2 goes into the list that contains the options for the x and y axis labels respectively
    gg[['x']][['layout']][['annotations']][[1]][['y']] <- x
    gg[['x']][['layout']][['annotations']][[2]][['x']] <- y
    gg
}


## 常用数据

library(data.table)

vender_info <- fread("/home/xuefeiqin/dmallBI/data-raw/vender_info.csv")

store_info <- fread("/home/xuefeiqin/dmallBI/data-raw/store_info.csv")

usethis::use_data(vender_info, store_info, overwrite = T)



