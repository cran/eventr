#' @title Get handlers
#'
#' @description This function returns the list of handlers on a dispatcher type object.
#'
#' @param obj a dispatcher object.
#'
#' @return \code{get_handlers()} Returns an \code{event} object.
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
#' the_handlers <- get_handlers(the_dispatcher)
#'
#' @export
get_handlers <- function(obj) UseMethod("get_handlers")

#' @export
get_handlers.dispatcher <- function(obj) obj[['handlers']]
