// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.petclinic.web;

import io.springlets.web.NotFoundException;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.petclinic.domain.Visit;
import org.springframework.roo.petclinic.service.api.VisitService;
import org.springframework.roo.petclinic.web.VisitsItemJsonController;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.util.UriComponents;

privileged aspect VisitsItemJsonController_Roo_JSON {
    
    declare @type: VisitsItemJsonController: @RestController;
    
    declare @type: VisitsItemJsonController: @RequestMapping(value = "/visits/{visit}", name = "VisitsItemJsonController", produces = MediaType.APPLICATION_JSON_VALUE);
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param visitService
     */
    @Autowired
    public VisitsItemJsonController.new(VisitService visitService) {
        this.visitService = visitService;
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Visit
     */
    @ModelAttribute
    public Visit VisitsItemJsonController.getVisit(@PathVariable("visit") Long id) {
        Visit visit = visitService.findOne(id);
        if (visit == null) {
            throw new NotFoundException(String.format("Visit with identifier '%s' not found",id));
        }
        return visit;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visit
     * @return ResponseEntity
     */
    @GetMapping(name = "show")
    public ResponseEntity<?> VisitsItemJsonController.show(@ModelAttribute Visit visit) {
        return ResponseEntity.status(HttpStatus.FOUND).body(visit);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visit
     * @return UriComponents
     */
    public static UriComponents VisitsItemJsonController.showURI(Visit visit) {
        return MvcUriComponentsBuilder
            .fromMethodCall(
                MvcUriComponentsBuilder.on(VisitsItemJsonController.class).show(visit))
            .buildAndExpand(visit.getId()).encode();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param storedVisit
     * @param visit
     * @param result
     * @return ResponseEntity
     */
    @PutMapping(name = "update")
    public ResponseEntity<?> VisitsItemJsonController.update(@ModelAttribute Visit storedVisit, @Valid @RequestBody Visit visit, BindingResult result) {
        
        if (result.hasErrors()) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(result);
        }
        visit.setId(storedVisit.getId());
        visitService.save(visit);
        return ResponseEntity.ok().build();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visit
     * @return ResponseEntity
     */
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> VisitsItemJsonController.delete(@ModelAttribute Visit visit) {
        visitService.delete(visit);
        return ResponseEntity.ok().build();
    }
    
}
