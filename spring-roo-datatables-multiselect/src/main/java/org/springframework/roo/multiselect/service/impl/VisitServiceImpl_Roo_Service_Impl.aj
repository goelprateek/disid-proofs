// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.multiselect.service.impl;

import io.springlets.data.domain.GlobalSearch;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.multiselect.domain.Pet;
import org.springframework.roo.multiselect.domain.Vet;
import org.springframework.roo.multiselect.domain.Visit;
import org.springframework.roo.multiselect.repository.VisitRepository;
import org.springframework.roo.multiselect.service.api.VisitService;
import org.springframework.roo.multiselect.service.impl.VisitServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VisitServiceImpl_Roo_Service_Impl {
    
    declare parents: VisitServiceImpl implements VisitService;
    
    declare @type: VisitServiceImpl: @Service;
    
    declare @type: VisitServiceImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     */
    private VisitRepository VisitServiceImpl.visitRepository;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param visitRepository
     */
    @Autowired
    public VisitServiceImpl.new(VisitRepository visitRepository) {
        this.visitRepository = visitRepository;
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @param visit
     */
    @Transactional
    public void VisitServiceImpl.delete(Visit visit) {
        // Clear bidirectional many-to-one child relationship with Vet
        if (visit.getVet() != null) {
            visit.getVet().getVisits().remove(visit);
        }
        
        // Clear bidirectional many-to-one child relationship with Pet
        if (visit.getPet() != null) {
            visit.getPet().getVisits().remove(visit);
        }
        
        visitRepository.delete(visit);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    @Transactional
    public List<Visit> VisitServiceImpl.save(Iterable<Visit> entities) {
        return visitRepository.save(entities);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    @Transactional
    public void VisitServiceImpl.delete(Iterable<Long> ids) {
        List<Visit> toDelete = visitRepository.findAll(ids);
        visitRepository.deleteInBatch(toDelete);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return Visit
     */
    @Transactional
    public Visit VisitServiceImpl.save(Visit entity) {
        return visitRepository.save(entity);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return Visit
     */
    public Visit VisitServiceImpl.findOne(Long id) {
        return visitRepository.findOne(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public List<Visit> VisitServiceImpl.findAll(Iterable<Long> ids) {
        return visitRepository.findAll(ids);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<Visit> VisitServiceImpl.findAll() {
        return visitRepository.findAll();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public long VisitServiceImpl.count() {
        return visitRepository.count();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Visit> VisitServiceImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        return visitRepository.findAll(globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Visit> VisitServiceImpl.findByPet(Pet pet, GlobalSearch globalSearch, Pageable pageable) {
        return visitRepository.findByPet(pet, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Visit> VisitServiceImpl.findByVet(Vet vet, GlobalSearch globalSearch, Pageable pageable) {
        return visitRepository.findByVet(vet, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param pet
     * @return Long
     */
    public long VisitServiceImpl.countByPet(Pet pet) {
        return visitRepository.countByPet(pet);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param vet
     * @return Long
     */
    public long VisitServiceImpl.countByVet(Vet vet) {
        return visitRepository.countByVet(vet);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param description
     * @param visitDate
     * @param pageable
     * @return Page
     */
    public Page<Visit> VisitServiceImpl.findByDescriptionAndVisitDate(String description, Date visitDate, Pageable pageable) {
        return visitRepository.findByDescriptionAndVisitDate(description, visitDate, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visitDate1
     * @param visitDate2
     * @param pageable
     * @return Page
     */
    public Page<Visit> VisitServiceImpl.findByVisitDateBetween(Date visitDate1, Date visitDate2, Pageable pageable) {
        return visitRepository.findByVisitDateBetween(visitDate1, visitDate2, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param description
     * @param pageable
     * @return Page
     */
    public Page<Visit> VisitServiceImpl.findByDescriptionLike(String description, Pageable pageable) {
        return visitRepository.findByDescriptionLike(description, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param description
     * @param visitDate
     * @return Long
     */
    public long VisitServiceImpl.countByDescriptionAndVisitDate(String description, Date visitDate) {
        return visitRepository.countByDescriptionAndVisitDate(description, visitDate);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param visitDate1
     * @param visitDate2
     * @return Long
     */
    public long VisitServiceImpl.countByVisitDateBetween(Date visitDate1, Date visitDate2) {
        return visitRepository.countByVisitDateBetween(visitDate1, visitDate2);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param description
     * @return Long
     */
    public long VisitServiceImpl.countByDescriptionLike(String description) {
        return visitRepository.countByDescriptionLike(description);
    }
    
}