# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tag.create(name: 'AIDS', description:'AIDS', active:true)
Tag.create(name: 'Polio', description:'Polio', active:true)
Tag.create(name: 'Malaria & Denghi', description:'Malaria & Denghi', active:true)
Tag.create(name: 'Bed Nets', description:'Bed Nets', active:true)
Tag.create(name: 'Clean Cook Stoves', description:'Clean Cook Stoves', active:true)
Tag.create(name: 'Christian', description:'Christian', active:true)
Tag.create(name: 'Islam', description:'Islam', active:true)
Tag.create(name: 'Rotary', description:'Rotary', active:true)
Tag.create(name: 'War Veterans', description:'War Veterans', active:true)

Service.create(name: 'Agent Orange Mitigation', description:'Agent Orange Mitigation', active:true)
Service.create(name: 'Agriculture, Forestry & Fisheries [AFF]', description:'Agriculture, Forestry & Fisheries [AFF]', active:true)
Service.create(name: 'Arts and Culture', description:'Arts and Culture', active:true)
Service.create(name: 'Capacity Development', description:'Capacity Development', active:true)
Service.create(name: 'Child Welfare & Orphanages', description:'Child Welfare & Orphanages', active:true)
Service.create(name: 'Clean Energy', description:'Clean Energy', active:true)
Service.create(name: 'Conservation, Environment & Animal Welfare', description:'Conservation, Environment & Animal Welfare', active:true)
Service.create(name: 'Democracy, Governance & Transparency', description:'Democracy, Governance & Transparency', active:true)
Service.create(name: 'Disability', description:'Disability', active:true)
Service.create(name: 'Disaster Recovery/Resilience', description:'Disaster Recovery/Resilience', active:true)
Service.create(name: 'Economic Development, Microfinance& Saving', description:'Economic Development, Microfinance& Saving', active:true)
Service.create(name: 'Education & Training', description:'Education & Training', active:true)
Service.create(name: 'Health', description:'Health', active:true)
Service.create(name: 'Housing', description:'Housing', active:true)
Service.create(name: 'Information & Technology', description:'Information & Technology', active:true)
Service.create(name: 'Media/Marketing/Fundraising', description:'Media/Marketing/Fundraising', active:true)
Service.create(name: 'Poverty', description:'Poverty', active:true)
Service.create(name: 'Refugees', description:'Refugees', active:true)
Service.create(name: 'Unexploded Ordnance (UXO)', description:'Unexploded Ordnance (UXO)', active:true)
Service.create(name: 'Water, Sanitation and Hygiene (WASH)', description:'Water, Sanitation and Hygiene (WASH)', active:true)
Service.create(name: 'Women & Girls', description:'Women & Girls', active:true)
