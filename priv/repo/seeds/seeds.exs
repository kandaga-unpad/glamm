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
    id: 1,
    collection_name: "Infografis",
    description: "Kumpulan infografis yang menarik dan informatif"
  },
  %{
    id: 2,
    collection_name: "Artefak",
    description: "Kumpulan artefak yang menarik dan informatif"
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
