#' A Random Lorem Ipsum
#'
#' @param nchars number of characters. One of the two params should be left NULL.
#' @param nwords number of words to return. One of the two params should be left NULL.
#' @param offset number of characters or words to offset the result by. Defaults to 0.
#'
#' @importFrom attempt stop_if_all
#'
#' @return a text
#'
#' @export

random_text <- function(nchars = NULL, nwords = NULL, offset=0){
  stop_if_all(
    c(nchars, nwords),
    is.null,
    "Please enter a nchars or nwords"
  )
  stop_if_all(
    list(nchars, nwords),
    ~ !is.null(.x),
    "You can't chose both nchars and nwords"
  )

  if (!is.null(nchars)){
    res <- substr(
      shinipsum::lorem,
      1+offset,
      nchars+offset
    )
  } else {
    res <- paste(shinipsum::lorem_words[1+offset:nwords+offset], collapse = " ")
  }

  substr(res, 1, 1) <- toupper(substr(res, 1, 1))
  res
}

