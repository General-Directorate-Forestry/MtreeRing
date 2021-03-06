% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pith_measure.R
\name{pith_measure}
\alias{pith_measure}
\title{Calibrate ring-width series}
\usage{
pith_measure(ring.data, inner.arc = TRUE, last.yr = NULL,
  color = "black", border.type = 16, label.cex = 1.5)
}
\arguments{
\item{ring.data}{A magick image object produced by \code{\link{ring_read}}.}

\item{inner.arc}{A logical value indicating whether to calibrate the 
ring-width series using the arcs of inner rings. See details below.}

\item{last.yr}{\code{NULL} or an integer giving the year of formation 
of the left-most ring. If \code{NULL}, border numbers (starting from 1) 
are used instead of years.}

\item{color}{Color for labels.}

\item{border.type}{Symbol for ring borders. See \code{pch} in 
\code{\link{points}} for possible values and shapes.}

\item{label.cex}{The magnification to be used for years or border numbers.}
}
\value{
A data frame of the calibrated ring-width series. The measurements 
units are millimeters (mm)
}
\description{
This function can calibrate the ring-width series 
using arcs of inner rings.
}
\details{
This function allows the user to create a path, and manually mark 
ring borders by clicking on the graphical window. 

An example demonstrated with pictures can be found in the package vignette. 
Type \code{vignette('pith-MtreeRing')} to see this example.

\itemize{
\item
If \code{inner.arc = TRUE}, the ring-width series is calibrated using arcs 
of inner rings (Duncan, 1989).
 
\bold{Step1}. You can click the left mouse button to add a horizontal path.
The path should traverse an appropriate arc (read the reference below  
for more details).

\bold{Step2}. You can add three points to the selected arc by
left-clicking. The first point should be placed on the left endpoint of 
the arc, and the second point is placed on the right endpoint. 

After adding these two points, a vertical dashed line will be plotted 
automatically according to the (x,y) positions of endpoints you just added. 
The third points should be placed on the intersection of the vertical 
dashed line and the selected arc. 

\bold{Step3}. you are prompted to mark tree rings along the path by 
left-clicking on the image. Every click draws a point.
Note that the left endpoint of the arc will be considered as the last 
ring border without the need to mark it. 

After marking tree rings, the identification process does not automatically 
stop by itself. On the Windows platform, the identification process 
can be terminated by clicking the second button and selecting \bold{Stop} 
from the menu. On the MacOS system, you can press the \bold{Escape} key to 
terminate this process.

The ring-width series are corrected using formulas proposed by Duncan (1989).

\item
If \code{inner.arc = FALSE}, the user can create a path which matches 
the direction of wood growth. 

\bold{Step1}. You can add two points by left-clicking on the image. 
Every click draws a point.
A path passing through these two points will be plotted. The path should 
follow the rays from bark to pith.

\bold{Step2}. You can mark tree rings along the path by left-clicking
on the image. The termination of identification process is similar.
}
}
\examples{
img.path <- system.file("missing_pith.png", package = "MtreeRing")

## Read the image:
t1 <- ring_read(img = img.path, dpi = 1200, plot = FALSE)

## Use the arcs of inner rings to calibrate ring-width series:
\donttest{t2 <- pith_measure(t1, inner.arc = TRUE, last.yr = 2016)}

## Try another method to measure ring widths:
\donttest{t3 <- pith_measure(t1, inner.arc = FALSE, last.yr = 2016)}
}
\references{
Duncan R. (1989) 
An evaluation of errors in tree age estimates based on increment cores 
in Kahikatea (Dacrycarpus dacrydiodes).
\emph{New Zealand Natural Sciences}
\bold{16(4)}, 1-37.
}
\author{
Jingning Shi
}
