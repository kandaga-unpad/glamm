# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Glamm.Repo.insert!(%Glamm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Populate the Vocabularies Metadata
alias Glamm.Repo
alias Glamm.Gallery
alias Glamm.Metadata
alias Glamm.Metadata.ResourceClass

# Populate the Vocabularies Metadata
vocab = [
  %{
    id: 1,
    namespace_url: "http://purl.org/dc/terms/",
    prefix: "dcterms",
    label: "Dublin Core",
    information: "Basic resource metadata (DCMI Metadata Terms)"
  },
  %{
    id: 2,
    namespace_url: "http://purl.org/dc/dcmitype/",
    prefix: "dctype",
    label: "Dublin Core Type",
    information: "Basic resource types (DCMI Type Vocabulary)"
  },
  %{
    id: 3,
    namespace_url: "http://purl.org/ontology/bibo/",
    prefix: "bibo",
    label: "Bibliographic Ontology",
    information: "Bibliographic metadata (BIBO)"
  },
  %{
    id: 4,
    namespace_url: "http://xmlns.com/foaf/0.1/",
    prefix: "foaf",
    label: "Friend of a Friend",
    information: "Relationships between people and organizations (FOAF)"
  }
]

for vocabulary <- vocab do
  Metadata.create_vocabulary(vocabulary)
end

# Populate Collection Types
gallery_collection_types = [
  %{
    "id" => 1,
    "collection_name" => "Infografis",
    "description" => "Kumpulan infografis yang menarik dan informatif"
  },
  %{
    "id" => 2,
    "collection_name" => "Artefak",
    "description" => "Kumpulan artefak yang menarik dan informatif"
  }
]

for collection <- gallery_collection_types do
  Gallery.create_collection_type(collection)
end

# Populate Node List
node_list = [
  %{
    id: 1,
    name: "Fakultas Hukum",
    abbr: "FH",
    groups: nil,
    image: nil
  },
  %{
    id: 2,
    name: "Fakultas Ekonomi dan Bisnis",
    abbr: "FEB",
    groups: nil,
    image: nil
  },
  %{
    id: 3,
    name: "Fakultas Kedokteran",
    abbr: "FK",
    groups: nil,
    image: nil
  },
  %{
    id: 4,
    name: "Fakultas Matematika dan Ilmu Pengetahuan Alam",
    abbr: "FMIPA",
    groups: nil,
    image: nil
  },
  %{
    id: 5,
    name: "Fakultas Pertanian",
    abbr: "Faperta",
    groups: nil,
    image: nil
  },
  %{
    id: 6,
    name: "Fakultas Kedokteran Gigi",
    abbr: "FKG",
    groups: nil,
    image: nil
  },
  %{
    id: 7,
    name: "Fakultas Ilmu Sosial dan Ilmu Politik",
    abbr: "FISIP",
    groups: nil,
    image: nil
  },
  %{
    id: 8,
    name: "Fakultas Ilmu Budaya",
    abbr: "FIB",
    groups: nil,
    image: nil
  },
  %{
    id: 9,
    name: "Fakultas Psikologi",
    abbr: "FAPSI",
    groups: nil,
    image: nil
  },
  %{
    id: 10,
    name: "Fakultas Peternakan",
    abbr: "FAPET",
    groups: nil,
    image: nil
  },
  %{
    id: 11,
    name: "Fakultas Ilmu Komunikasi",
    abbr: "FIKOM",
    groups: nil,
    image: nil
  },
  %{
    id: 12,
    name: "Fakultas Keperawatan",
    abbr: "FKEP",
    groups: nil,
    image: nil
  },
  %{
    id: 13,
    name: "Fakultas Perikanan dan Ilmu Kelautan",
    abbr: "FPIK",
    groups: nil,
    image: nil
  },
  %{
    id: 14,
    name: "Fakultas Teknologi Industri Pertanian",
    abbr: "FTIP",
    groups: nil,
    image: nil
  },
  %{
    id: 15,
    name: "Sekolah Pascasarjana",
    abbr: "SPS",
    groups: nil,
    image: nil
  },
  %{
    id: 16,
    name: "Fakultas Farmasi",
    abbr: "FARMASI",
    groups: nil,
    image: nil
  },
  %{
    id: 17,
    name: "Fakultas Teknik Geologi",
    abbr: "FTG",
    groups: nil,
    image: nil
  },
  %{
    id: 18,
    name: "Perpustakaan Pangandaran",
    abbr: "Pangandaran",
    groups: nil,
    image: nil
  },
  %{
    id: 19,
    name: "Perpustakaan Garut",
    abbr: "Garut",
    groups: nil,
    image: nil
  },
  %{
    id: 20,
    name: "Perpustakaan Pusat",
    abbr: "Kandaga",
    groups: nil,
    image: nil
  },
  %{
    id: 21,
    name: "Fakultas Vokasi",
    abbr: "Vokasi",
    groups: nil,
    image: nil
  }
]

for node <- node_list do
  Glamm.System.create_node(node)
end

# Populate the Resource Classes Metadata
vocabulary_1 = Repo.get!(Metadata.Vocabulary, 1)
vocabulary_2 = Repo.get!(Metadata.Vocabulary, 2)
vocabulary_3 = Repo.get!(Metadata.Vocabulary, 3)
vocabulary_4 = Repo.get!(Metadata.Vocabulary, 4)

resource_class = [
  %{
    "information" => "A resource that acts or has the power to act.",
    "id" => 1,
    "label" => "Agent",
    "local_name" => "Agent",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A group of agents.",
    "id" => 2,
    "label" => "Agent Class",
    "local_name" => "AgentClass",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A book, article, or other documentary resource.",
    "id" => 3,
    "label" => "Bibliographic Resource",
    "local_name" => "BibliographicResource",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A digital resource format.",
    "id" => 4,
    "label" => "File Format",
    "local_name" => "FileFormat",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A rate at which something recurs.",
    "id" => 5,
    "label" => "Frequency",
    "local_name" => "Frequency",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "The extent or range of judicial, law enforcement, or other authority.",
    "id" => 6,
    "label" => "Jurisdiction",
    "local_name" => "Jurisdiction",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" =>
      "A legal document giving official permission to do something with a Resource.",
    "id" => 7,
    "label" => "License Document",
    "local_name" => "LicenseDocument",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" =>
      "A system of signs, symbols, sounds, gestures, or rules used in communication.",
    "id" => 8,
    "label" => "Linguistic System",
    "local_name" => "LinguisticSystem",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A spatial region or named place.",
    "id" => 9,
    "label" => "Location",
    "local_name" => "Location",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A location, period of time, or jurisdiction.",
    "id" => 10,
    "label" => "Location, Period, or Jurisdiction",
    "local_name" => "LocationPeriodOrJurisdiction",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A file format or physical medium.",
    "id" => 11,
    "label" => "Media Type",
    "local_name" => "MediaType",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A media type or extent.",
    "id" => 12,
    "label" => "Media Type or Extent",
    "local_name" => "MediaTypeOrExtent",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A process that is used to engender knowledge, attitudes, and skills.",
    "id" => 13,
    "label" => "Method of Instruction",
    "local_name" => "MethodOfInstruction",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A method by which resources are added to a collection.",
    "id" => 14,
    "label" => "Method of Accrual",
    "local_name" => "MethodOfAccrual",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "An interval of time that is named or defined by its start and end dates.",
    "id" => 15,
    "label" => "Period of Time",
    "local_name" => "PeriodOfTime",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A physical material or carrier.",
    "id" => 16,
    "label" => "Physical Medium",
    "local_name" => "PhysicalMedium",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A material thing.",
    "id" => 17,
    "label" => "Physical Resource",
    "local_name" => "PhysicalResource",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" =>
      "A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.",
    "id" => 18,
    "label" => "Policy",
    "local_name" => "Policy",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" =>
      "A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.",
    "id" => 19,
    "label" => "Provenance Statement",
    "local_name" => "ProvenanceStatement",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" =>
      "A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.",
    "id" => 20,
    "label" => "Rights Statement",
    "local_name" => "RightsStatement",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "A dimension or extent, or a time taken to play or execute.",
    "id" => 21,
    "label" => "Size or Duration",
    "local_name" => "SizeOrDuration",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" =>
      "A basis for comparison; a reference point against which other things can be evaluated.",
    "id" => 22,
    "label" => "Standard",
    "local_name" => "Standard",
    "owner_id" => nil,
    "vocabulary_id" => 1
  },
  %{
    "information" => "An aggregation of resources.",
    "id" => 23,
    "label" => "Collection",
    "local_name" => "Collection",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" => "Data encoded in a defined structure.",
    "id" => 24,
    "label" => "Dataset",
    "local_name" => "Dataset",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" => "A non-persistent, time-based occurrence.",
    "id" => 25,
    "label" => "Event",
    "local_name" => "Event",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" => "A visual representation other than text.",
    "id" => 26,
    "label" => "Image",
    "local_name" => "Image",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" =>
      "A resource requiring interaction from the user to be understood, executed, or experienced.",
    "id" => 27,
    "label" => "Interactive Resource",
    "local_name" => "InteractiveResource",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" => "A system that provides one or more functions.",
    "id" => 28,
    "label" => "Service",
    "local_name" => "Service",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" => "A computer program in source or compiled form.",
    "id" => 29,
    "label" => "Software",
    "local_name" => "Software",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" => "A resource primarily intended to be heard.",
    "id" => 30,
    "label" => "Sound",
    "local_name" => "Sound",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" => "A resource consisting primarily of words for reading.",
    "id" => 31,
    "label" => "Text",
    "local_name" => "Text",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" => "An inanimate, three-dimensional object or substance.",
    "id" => 32,
    "label" => "Physical Object",
    "local_name" => "PhysicalObject",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" => "A static visual representation.",
    "id" => 33,
    "label" => "Still Image",
    "local_name" => "StillImage",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" =>
      "A series of visual representations imparting an impression of motion when shown in succession.",
    "id" => 34,
    "label" => "Moving Image",
    "local_name" => "MovingImage",
    "owner_id" => nil,
    "vocabulary_id" => 2
  },
  %{
    "information" => "A scholarly academic article, typically published in a journal.",
    "id" => 35,
    "label" => "Academic Article",
    "local_name" => "AcademicArticle",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.",
    "id" => 36,
    "label" => "Article",
    "local_name" => "Article",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "An audio document; aka record.",
    "id" => 37,
    "label" => "audio document",
    "local_name" => "AudioDocument",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "An audio-visual document; film, video, and so forth.",
    "id" => 38,
    "label" => "audio-visual document",
    "local_name" => "AudioVisualDocument",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "Draft legislation presented for discussion to a legal body.",
    "id" => 39,
    "label" => "Bill",
    "local_name" => "Bill",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.",
    "id" => 40,
    "label" => "Book",
    "local_name" => "Book",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A section of a book.",
    "id" => 41,
    "label" => "Book Section",
    "local_name" => "BookSection",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A written argument submitted to a court.",
    "id" => 42,
    "label" => "Brief",
    "local_name" => "Brief",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A chapter of a book.",
    "id" => 43,
    "label" => "Chapter",
    "local_name" => "Chapter",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A collection of statutes.",
    "id" => 44,
    "label" => "Code",
    "local_name" => "Code",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A document that simultaneously contains other documents.",
    "id" => 45,
    "label" => "Collected Document",
    "local_name" => "CollectedDocument",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A collection of Documents or Collections",
    "id" => 46,
    "label" => "Collection",
    "local_name" => "Collection",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A meeting for consultation or discussion.",
    "id" => 47,
    "label" => "Conference",
    "local_name" => "Conference",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A collection of legal cases.",
    "id" => 48,
    "label" => "Court Reporter",
    "local_name" => "CourtReporter",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.",
    "id" => 49,
    "label" => "Document",
    "local_name" => "Document",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "a distinct part of a larger document or collected document.",
    "id" => 50,
    "label" => "document part",
    "local_name" => "DocumentPart",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "The status of the publication of a document.",
    "id" => 51,
    "label" => "Document Status",
    "local_name" => "DocumentStatus",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "An edited book.",
    "id" => 52,
    "label" => "Edited Book",
    "local_name" => "EditedBook",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A written communication addressed to a person or organization and transmitted electronically.",
    "id" => 53,
    "label" => "EMail",
    "local_name" => "Email",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => nil,
    "id" => 54,
    "label" => "Event",
    "local_name" => "Event",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A passage selected from a larger work.",
    "id" => 55,
    "label" => "Excerpt",
    "local_name" => "Excerpt",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "aka movie.",
    "id" => 56,
    "label" => "Film",
    "local_name" => "Film",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.",
    "id" => 57,
    "label" => "Hearing",
    "local_name" => "Hearing",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A document that presents visual or diagrammatic information.",
    "id" => 58,
    "label" => "Image",
    "local_name" => "Image",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A formalized discussion between two or more people.",
    "id" => 59,
    "label" => "Interview",
    "local_name" => "Interview",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "something that is printed or published and distributed, esp. a given number of a periodical",
    "id" => 60,
    "label" => "Issue",
    "local_name" => "Issue",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A periodical of scholarly journal Articles.",
    "id" => 61,
    "label" => "Journal",
    "local_name" => "Journal",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A document accompanying a legal case.",
    "id" => 62,
    "label" => "Legal Case Document",
    "local_name" => "LegalCaseDocument",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.",
    "id" => 63,
    "label" => "Decision",
    "local_name" => "LegalDecision",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A legal document; for example, a court decision, a brief, and so forth.",
    "id" => 64,
    "label" => "Legal Document",
    "local_name" => "LegalDocument",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A legal document proposing or enacting a law or a group of laws.",
    "id" => 65,
    "label" => "Legislation",
    "local_name" => "Legislation",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A written or printed communication addressed to a person or organization and usually transmitted by mail.",
    "id" => 66,
    "label" => "Letter",
    "local_name" => "Letter",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.",
    "id" => 67,
    "label" => "Magazine",
    "local_name" => "Magazine",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A small reference book, especially one giving instructions.",
    "id" => 68,
    "label" => "Manual",
    "local_name" => "Manual",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "An unpublished Document, which may also be submitted to a publisher for publication.",
    "id" => 69,
    "label" => "Manuscript",
    "local_name" => "Manuscript",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A graphical depiction of geographic features.",
    "id" => 70,
    "label" => "Map",
    "local_name" => "Map",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A loose, thematic, collection of Documents, often Books.",
    "id" => 71,
    "label" => "Multivolume Book",
    "local_name" => "MultiVolumeBook",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.",
    "id" => 72,
    "label" => "Newspaper",
    "local_name" => "Newspaper",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "Notes or annotations about a resource.",
    "id" => 73,
    "label" => "Note",
    "local_name" => "Note",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.",
    "id" => 74,
    "label" => "Patent",
    "local_name" => "Patent",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A public performance.",
    "id" => 75,
    "label" => "Performance",
    "local_name" => "Performance",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A group of related documents issued at regular intervals.",
    "id" => 76,
    "label" => "Periodical",
    "local_name" => "Periodical",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A communication between an agent and one or more specific recipients.",
    "id" => 77,
    "label" => "Personal Communication",
    "local_name" => "PersonalCommunication",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A personal communication manifested in some document.",
    "id" => 78,
    "label" => "Personal Communication Document",
    "local_name" => "PersonalCommunicationDocument",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A compilation of documents published from an event, such as a conference.",
    "id" => 79,
    "label" => "Proceedings",
    "local_name" => "Proceedings",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "An excerpted collection of words.",
    "id" => 80,
    "label" => "Quote",
    "local_name" => "Quote",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A document that presents authoritative reference information, such as a dictionary or encylopedia .",
    "id" => 81,
    "label" => "Reference Source",
    "local_name" => "ReferenceSource",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..",
    "id" => 82,
    "label" => "Report",
    "local_name" => "Report",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A loose, thematic, collection of Documents, often Books.",
    "id" => 83,
    "label" => "Series",
    "local_name" => "Series",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A slide in a slideshow",
    "id" => 84,
    "label" => "Slide",
    "local_name" => "Slide",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A presentation of a series of slides, usually presented in front of an audience with written text and images.",
    "id" => 85,
    "label" => "Slideshow",
    "local_name" => "Slideshow",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A document describing a standard",
    "id" => 86,
    "label" => "Standard",
    "local_name" => "Standard",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A bill enacted into law.",
    "id" => 87,
    "label" => "Statute",
    "local_name" => "Statute",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A document created to summarize research findings associated with the completion of an academic degree.",
    "id" => 88,
    "label" => "Thesis",
    "local_name" => "Thesis",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "The academic degree of a Thesis",
    "id" => 89,
    "label" => "Thesis degree",
    "local_name" => "ThesisDegree",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.",
    "id" => 90,
    "label" => "Webpage",
    "local_name" => "Webpage",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" => "A group of Webpages accessible on the Web.",
    "id" => 91,
    "label" => "Website",
    "local_name" => "Website",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.",
    "id" => 92,
    "label" => "Workshop",
    "local_name" => "Workshop",
    "owner_id" => nil,
    "vocabulary_id" => 3
  },
  %{
    "information" =>
      "A foaf:LabelProperty is any RDF property with texual values that serve as labels.",
    "id" => 93,
    "label" => "Label Property",
    "local_name" => "LabelProperty",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "A person.",
    "id" => 94,
    "label" => "Person",
    "local_name" => "Person",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "A document.",
    "id" => 95,
    "label" => "Document",
    "local_name" => "Document",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "An organization.",
    "id" => 96,
    "label" => "Organization",
    "local_name" => "Organization",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "A class of Agents.",
    "id" => 97,
    "label" => "Group",
    "local_name" => "Group",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "An agent (eg. person, group, software or physical artifact).",
    "id" => 98,
    "label" => "Agent",
    "local_name" => "Agent",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "A project (a collective endeavour of some kind).",
    "id" => 99,
    "label" => "Project",
    "local_name" => "Project",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "An image.",
    "id" => 100,
    "label" => "Image",
    "local_name" => "Image",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "A personal profile RDF document.",
    "id" => 101,
    "label" => "PersonalProfileDocument",
    "local_name" => "PersonalProfileDocument",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "An online account.",
    "id" => 102,
    "label" => "Online Account",
    "local_name" => "OnlineAccount",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "An online gaming account.",
    "id" => 103,
    "label" => "Online Gaming Account",
    "local_name" => "OnlineGamingAccount",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "An online e-commerce account.",
    "id" => 104,
    "label" => "Online E-commerce Account",
    "local_name" => "OnlineEcommerceAccount",
    "owner_id" => nil,
    "vocabulary_id" => 4
  },
  %{
    "information" => "An online chat account.",
    "id" => 105,
    "label" => "Online Chat Account",
    "local_name" => "OnlineChatAccount",
    "owner_id" => nil,
    "vocabulary_id" => 4
  }
]

for resource <- resource_class do
  %ResourceClass{
    id: resource["id"],
    label: resource["label"],
    local_name: resource["local_name"],
    information: resource["information"],
    vocabulary_id:
      case resource["vocabulary_id"] do
        1 -> vocabulary_1.id
        2 -> vocabulary_2.id
        3 -> vocabulary_3.id
        4 -> vocabulary_4.id
        _ -> 1
      end
  }
  |> Repo.insert!()
end
