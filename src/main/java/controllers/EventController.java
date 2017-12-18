package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import services.EventService;
import domain.Event;

@Controller
@RequestMapping("/event")
public class EventController extends AbstractController{
	
	// Services
	// ===============================================================================

	@Autowired
	private EventService eventService;

	
	// Constructor
	// ============================================================================

	public EventController() {
		super();
	}

	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView result;

		Collection<Event> events;
		Collection<Event> eventsPast;
		Collection<Event> eventsFuture;

		events = eventService.findByMonthToStartAndSeats();
		eventsPast = eventService.findByPastsEvents();
		eventsFuture = this.eventService.findFutureEvents();

		result = new ModelAndView("event/listNotAuth");

		result.addObject("events", events);
		result.addObject("eventsPast", eventsPast);
		result.addObject("eventsFuture", eventsFuture);
		result.addObject("requestURI", "event/list.do");
		
		return result;
	}
	
	@RequestMapping("/lessOneMonth")
	public ModelAndView upComingEventsList() {
		ModelAndView result;

		Collection<Event> events;

		events = eventService.findByMonthToStartAndSeats();

		result = new ModelAndView("event/listFuture");

		result.addObject("eventsFuture", events);
		result.addObject("requestURI", "event/lessOneMonth.do");
		
		return result;
	}

}
