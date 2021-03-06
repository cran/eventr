#' @title Get dispatch function
#'
#' @description This function returns the dispatch function of a dispatcher type object.
#'
#' @param obj An object of class dispatcher.
#'
#' @return This function returns a function with three parameters \code{obj}, \code{events} and \code{accumulate}.
#' This function allows the user to evaluate a set of events.
#'
#' @import dplyr
#'
#' @examples
#'
#' library(eventr)
#' library(dplyr)
#'
#' birth_event <- event(
#'   id = 'first-id',
#'   type = 'BIRTH',
#'   time = '1936-11-09',
#'   birth_date = '1936-11-09'
#' )
#'
#' death_event <- event(
#'   id = 'second-id',
#'   type = 'DEATH',
#'   time = '2019-05-22',
#'   death_date = '2019-05-22'
#' )
#'
#' set_birth_date <- function(obj, event){
#'   obj$birth_date <- get_body_attr(event, "birth_date")
#'   return(obj)
#' }
#'
#' set_death_date <- function(obj, event){
#'   obj$death_date <- get_body_attr(event, "death_date")
#'   return(obj)
#' }
#'
#' birth_handler <- handler(type = 'BIRTH', FUN = set_birth_date)
#' death_handler <- handler(type = 'DEATH', FUN = set_death_date)
#'
#' handlers <- handlers_list(birth_handler, death_handler)
#'
#' the_dispatcher <- dispatcher(handlers)
#'
#' dispatch <- get_dispatch(the_dispatcher)
#'
#' events <- event_list(birth_event, death_event)
#'
#' the_obj <- dispatch(events = events, accumulate = FALSE)
#' the_obj
#'
#' the_obj <- dispatch(events = events, accumulate = TRUE)
#' the_obj
#'
#' # transform the_obj to data.frame
#' the_obj %>%
#'   purrr::map(as.data.frame) %>%
#'   bind_rows
#'
#' @export
get_dispatch <- function(obj) UseMethod("get_dispatch")

#' @export
get_dispatch.dispatcher <- function(obj) obj[['dispatch']]
