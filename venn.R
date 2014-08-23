library(ggplot2)
library(grid)
theme_bw()
theme_update(plot.margin=unit(c(0,0,-0.5,-0.5), "cm"),
             # axis.ticks.margin=unit(0, "cm"),
             # axis.ticks.length=unit(0, "cm"),
             plot.background=element_rect(color="gray75"),
             panel.background=element_rect(color="gray75"),
             axis.ticks=element_blank(),
             axis.text=element_blank(),
             axis.title=element_blank(),
             panel.grid.major=element_blank(),
             panel.grid.minor=element_blank()
)

plotVenn <- function(data.list, data.names) {
  n.sets <- length(data.list)

  if (n.sets == 2) {
    plotVenn2(data.list[[1]], data.list[[2]], data.names[1], data.names[2])
  }


}

plotVenn2 <- function(d1, d2, name1, name2) {
  sd1 <- setdiff(d1, d2)
  intr <- intersect(d1, d2)
  sd2 <- setdiff(d2, d1)

  ld1 <- length(unique(d1))
  ld2 <- length(unique(d2))

  lsd1 <- length(sd1)
  lintr <- length(intr)
  lsd2 <- length(sd2)

  c1df <- makeCircleDataFrame(-1, 0, 2)
  c2df <- makeCircleDataFrame(1, 0, 2)

  name1.lbl <- paste(name1, "\n(", ld1, ")", sep="")
  name2.lbl <- paste(name2, "\n(", ld2, ")", sep="")

  p.1 <- ggplot() + 
          geom_path(data=c1df, aes(x,y)) +
          geom_path(data=c2df, aes(x,y)) +
          annotate("text", x=0, y=0, label=lintr, size=6) +
          annotate("text", x=-1.75, y=0, label=lsd1, size=6) +
          annotate("text", x=1.75, y=0, label=lsd2, size=6) +
          annotate("text", x=-2, y=2.5, label=name1.lbl, size=6) +
          annotate("text", x=2, y=2.5, label=name2.lbl, size=6) +
          xlim(-3.25, 3.25)  + ylim(-2, 2.75)
}

plotVenn3 <- function(d1, d2, d3, name1, name2, name3) {
  ld1 <- length(d1)
  ld2 <- length(d2)
  ld3 <- length(d3)

  intr12 <- intersect(d1, d2)
  intr13 <- intersect(d1, d3)
  intr23 <- intersect(d2, d3)
  intr123 <- intersect(intr12, d3)

  # define regions of the Venn from left to right, top to botton
  r2 <- length(intr12) - length(intr123)
  r4 <- length(intr13) - length(intr123)
  r5 <- length(intr123)
  r6 <- length(intr23) - length(intr123)

  r1 <- ld1 - r2 - r4 - r5
  r3 <- ld2 - r2 - r5 - r6
  r7 <- ld3 - r4 - r5 - r6

  c1df <- makeCircleDataFrame(-1, 1, 2)
  c2df <- makeCircleDataFrame(1, 1, 2)
  c3df <- makeCircleDataFrame(0, -1, 2)

  name1.lbl <- paste(name1, "\n(", ld1, ")", sep="")
  name2.lbl <- paste(name2, "\n(", ld2, ")", sep="")
  name3.lbl <- paste(name3, "\n(", ld3, ")", sep="")

  p.1 <- ggplot() + 
          geom_path(data=c1df, aes(x,y)) +
          geom_path(data=c2df, aes(x,y)) +
          geom_path(data=c3df, aes(x,y)) +
          annotate("text", x=-1.75, y=1.5, label=r1, size=6) +
          annotate("text", x=0.0, y=1.5, label=r2, size=6) +
          annotate("text", x=1.75, y=1.5, label=r3, size=6) +
          annotate("text", x=-1.25, y=-0.35, label=r4, size=6) +
          annotate("text", x=0.0, y=0.25, label=r5, size=6) +
          annotate("text", x=1.25, y=-0.25, label=r6, size=6) +
          annotate("text", x=0.0, y=-1.75, label=r7, size=6) +
          annotate("text", x=-2, y=3.5, label=name1.lbl, size=6) +
          annotate("text", x=2, y=3.5, label=name2.lbl, size=6) +
          annotate("text", x=0, y=-3.5, label=name3.lbl, size=6) +
          xlim(-4.25, 4.35) + ylim(-4, 4)
}

makeCircleDataFrame <- function(cx, cy, r, dtheta=0.1) {
  angles <- seq(0, 2*pi + dtheta, by=dtheta)
  xvals <- r*cos(angles) + cx
  yvals <- r*sin(angles) + cy
  return(data.frame(x=xvals, y=yvals))
}

# # test case
# v1 <- 1:100000
# v2 <- 500:200000

# p.1 <- plotVenn2(v1, v2, "Set1", "Set2")


